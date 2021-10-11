/*
  Author:    Y S K Abhijeet
  License:   MIT License

  Copyright (c) 2021 Y S K Abhijeet


  This software is licensed under the MIT License(http://opensource.org/licenses/MIT).

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
  NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


  This program will calculate the SpO2% and Heart rate of subject.

  ********************Program Flow********************************

  Find red/ir signal levels
  Change intensity until within acceptable levels
  Find required gain level and amplify the signal
  Filter the samples
  Read samples for SpO2 and HR calculation

  ********************Consulted Reference Papers******************

  For Heart Rate:

  ArgÃijello-Prada, Erick Javier. The mountaineer’s method for
  peak detection in photoplethysmographic signals. Revista Facul-
  tad De Ingenieria-universidad De Antioquia 2018 (2019): 42-50
  https://api.semanticscholar.org/CorpusID:116767900

  For SpO2:

  Michael W. Wukitsch, BA,Michael T. Petterson, BA, RRT, CPFT,
  David R. Tobler, BSEE,and Jonas A. Pologe, BSEE
  PULSE OXIMETRY: ANALYSIS OF THEORY,TECHNOLO6Y, AND PRACTICE
  https://link.springer.com/article/10.1007%2FBF01617328


  **********************Used External Libraries********************

  OLED Library
  ssd1306 by lexus2k
  https://github.com/lexus2k/ssd1306

  changed user_settings.h for software I2C mode
  changed ssd1306_i2c_embedded.c for ATmega4808 ports 
  changed ssd1306_i2c_conf.h to add ATmega4808 i2c pins

  To view OLED Images
  bmp2hex by Robert Gallup
  https://github.com/robertgallup/python-bmp2hex
  Process:
  - get your image
  - invert, resize as per display(128x64) and change to 1-bit mode on GIMP
  - export image as bmp
  - run: python3 bmp2hex.py -w 8 -x -i image.bmp  > out.c
  - copy the array in out.c to bitmap.h 

  ***********************Programming Info**************************

  One Time Activity - change device fuse for 8Mhz internal oscillitor.
  https://docs.platformio.org/en/latest/platforms/atmelmegaavr.html
  I was not able to get that done via PIO, so i used jtag2updi package
  https://github.com/ElTangas/jtag2updi and https://github.com/MCUdude/MegaCoreX
  selected Clock: Internal 8 MHz, uploaded to device via Arduino IDE.

  Programming Device - 
  used CP2102 usb to serial adapter for programming with UPDI interface
  via pyupdi https://github.com/mraardvark/pyupdi

  Upload and platform options in platformio.ini file.
  Any docs mentioned here in comments are present in project's reference folder
*/

#include <Arduino.h>
#include <Wire.h>
#include "../lib/ssd1306/src/ssd1306.h"
#include "bitmaps.h"


#define IR_PULSE_PIN PIN_PF4    //IR Pulse signal Pin
#define RED_PULSE_PIN PIN_PA4   //RED Pulse signal Pin
#define ITOV_PIN PIN_PD0        //ITOV stage output Pin
#define PPG_PIN PIN_PD3         //Signal Output Pin

//8bit DAC - MCP47FEB02A0
#define DAC_SDA_PIN PIN_PA2
#define DAC_SCL_PIN PIN_PA3
#define DAC_ADDR 0x60           //DAC I2c device Address
#define DAC_LED_REG 0x08        //DAC output register address mapped to VOUT1
#define DAC_DIFF_REG 0x00       //DAC output register address mapped to VOUT0

//OLED Pins
#define OLED_SDA 2
#define OLED_SCL 3
#define OLED_ADDR 0x3C

#define SAMP_N 20               //Number of SpO2 samples to weight for calculation

//PGA Pins
enum PGAI {
  PGAI0 = 17,
  PGAI1,
  PGAI2
};

uint8_t state;
unsigned long now;


uint16_t red_itov,
         ir_itov,
         ir_itov_max,
         ir_itov_min,
         red_itov_min,
         red_itov_max,
         ambient;

uint16_t ir_amp,
         ir_amp_prev = 0,
         red_amp,
         red_amp_prev = 0;

uint8_t dac_ir_level = 0,
        dac_red_level = 0,
        dac_low_level = 40;

uint16_t ir_out,
         red_out,
         red_out_prev = 0,
         ir_out_prev = 0;

bool is_red_peak = 0,
     is_ir_peak = 0,
     ir_led_set = 0,
     red_led_set = 0,
     start_disp = 0;

uint8_t red_ctr = 0,
        ir_ctr = 0,
        red_comp = 30,
        ir_comp = 30;

uint8_t ir_hr,
        red_hr,
        hr = 0;

unsigned long ir_t_prev = 0,
              red_t_prev = 0,
              red_t,
              ir_t;

uint8_t led_level_red = 60;
uint8_t led_level_ir = 60;

//Butterworth 1st order coefficients for 500hz sampling rate
float a2 = -0.95937;
float b = 0.020316;

//Parameters for SpO2 calculation
uint16_t spo2_wt[SAMP_N] = {0};         //Array of Weighted samples
uint8_t wt[SAMP_N] = {0};               //Array of Weights
uint8_t spo2_avg = 99;                  //Inital average SpO2
uint8_t sample_n = 0;                   //Samples Counter
uint8_t spo2_avg_in[SAMP_N/2] = {0};    //Array of Weighted Averages
uint8_t spo2_ctr = 0;                   //Average Samples Counter

/*
Reference Doc - AN2447: Measure VCC/Battery Voltage Without Using I/O Pin
http://ww1.microchip.com/downloads/en/AppNotes/00002447A.pdf
*/
uint8_t calc_battery_level()
{
  //set VREF of AC0 to internal voltage 2.5V
  VREF.CTRLA = 0x02;

  //set required DACREF voltage, setting VDACREF to 2.5V
  //for 2 AAA batteries, 2.5V would be considered as dead - 0% 
  AC0.DACREF = 0xFF;

  //set ADC ref to VCC for comparison, DIV256 prescalar setting
  //result dosent populate correctly for lower division factors
  ADC0.CTRLC = 87;

  //now set ADC mux for DACREF input
  ADC0.MUXPOS = 0x1C;

  //start ADC,10bit resolution, in single mode
  ADC0.CTRLA = 0x1;  
 
  //start conversion
  ADC0.COMMAND = 0x01;
  /* Wait for result ready */
  while (!(ADC0.INTFLAGS & ADC_RESRDY_bm));

  uint16_t res = ADC0.RES;

  /*
  Assuming a healthy battery to have voltage 3.1V, RES would be
  (1023/3.1)*2.5 = 825, anything below this value considered as full(99%)
  if res is 1023, ADC ref = DACREF, consider battery as dead(0%)
  in between, calculate percentages linearly
  in practise, change battery if below 50% as oled might not turn on properly for
  voltages below 2.8V

  I used duracell AAA batteries, MN2400
  https://www.duracell.com/wp-content/uploads/2020/02/MN24US1119.pdf
  lets consider 2.7 as threshold and max average device current draw is 25mA
  from datasheet, continuous operation period should be around 13hrs.
  */

  uint8_t battery_perc;

  if(res <= 825)
    battery_perc = 99;
  else
    battery_perc = (1023 - res)/2;

  return battery_perc;

}

//Sets the required Ouput register of DAC
void set_DAC(uint8_t reg, uint8_t val)
{

  Wire.beginTransmission(DAC_ADDR);
	Wire.write(reg);
  Wire.write(0);                      //1st word byte always zero for 8bit DAC as in datasheet
  Wire.write(val); 
  Wire.endTransmission(); 

}

void set_DAC_diff(uint8_t level)
{
  set_DAC(DAC_DIFF_REG, level);
  delayMicroseconds(10); //Small delay to avoid ringing on edge to be considered in difference Amp Stage            
}


uint16_t low_pass_filter(uint16_t x, uint16_t x_prev, uint16_t filt_out_prev)
{
    //1st order IIR low pass filter.    
    uint16_t filt_out = b*x + b*x_prev - a2*filt_out_prev;
    return filt_out;
}


void setup()
{
  Serial.begin(230400);          

  //calc battery percentage
  uint8_t batp = calc_battery_level();
  char batp_str[4];
  sprintf(batp_str, "%d%%", batp);   

  //Initialize OLED Display, SCL/SDA Pins as per PORTF(PF2/PF3)
  ssd1306_128x64_i2c_initEx(OLED_SCL,OLED_SDA,OLED_ADDR);
  ssd1306_clearScreen();
  /*Was not able to use BMP images with Bitmap function,images were not showing properly
  hence used bmp2hex to convert to xbmp and used XBitmap function,images appear fine now.*/

  //Logos displayed in wait state, until parameters are found
  ssd1306_drawXBitmap(0, 0, 87, 64, dhadak_logo);
  ssd1306_drawXBitmap(95, 2, 24, 24, battery_logo);
  ssd1306_setFixedFont(courier_new_font11x16_digits);
  ssd1306_printFixed(95,0,batp_str, STYLE_NORMAL);
  ssd1306_setFixedFont(ssd1306xled_font6x8);
  ssd1306_printFixed(0,56, "Please wait 15secs...", STYLE_NORMAL);
  ssd1306_setFixedFont(comic_sans_font24x32_123);

  pinMode(IR_PULSE_PIN,OUTPUT);
  pinMode(RED_PULSE_PIN,OUTPUT);

  //initially no PGA engaged
  pinMode(PGAI0,OUTPUT);
  pinMode(PGAI1,OUTPUT);
  pinMode(PGAI2,OUTPUT);
  digitalWrite(PGAI0,LOW);
  digitalWrite(PGAI1,LOW);
  digitalWrite(PGAI2,LOW);


  //initialize I2C for DAC communication
  Wire.begin();                           //default Pins 32 - SDA, 1 - SCL for I2C 
  Wire.setClock(400000);

  //Set LED DAC to off initially
  set_DAC(DAC_LED_REG,0);    
            
  //set internal VREF to 1.1
  VREF.CTRLA = 0x10;
  
  state = 0;
  Serial.println("Initialization Complete");
}


void loop()
{
  
  /*Delay 100us and 40us are placed to get effective individual pulse period of red
  and ir to be 500hz, this is a not a good solution but works ok.
  ideal solutions could be to use counters and use count value to first set the DACs
  then Leds. I decided to stick with delay version as it worked fine.*/

  //for IR
  set_DAC_diff(dac_ir_level);         //Set DAC level for IR Signal
  set_DAC(DAC_LED_REG,led_level_ir);  //Set IR Led brightness level
  digitalWrite(IR_PULSE_PIN,HIGH);    //Start IR Led
  delayMicroseconds(100);             
  
  ADC0.CTRLC = 82;                    //set ADC VREF to VCC and prescalar to 8
  /*
  dosen't go to 80, looks like i can't do faster clock speed for VCC above 3.3V, ADC dosen't work.
  80 works fine for battery voltage ~3V but for 3.3V source, ADC gets stuck and outpus 1024 only.
  Hence settled for div by 8 prescalar, enough for 500hz effective sample frequency
  */
  ADC0.CTRLB = 0;                     //no accumulation of Samples
  ir_itov = analogRead(ITOV_PIN);     //Read ItoV stage value for IR
  ADC0.CTRLC = 66;                    //Change ADC Internal Reference to 1.1V
  ADC0.CTRLB = 6;                     //Oversampling, Accumulate 64 samples
  ir_amp = analogRead(PPG_PIN);       //Read PPG output
  ir_amp >>=3;                        //Right shift by 3 to get 13 bit output
  digitalWrite(IR_PULSE_PIN,LOW);     //Turn off IR LED           
  delayMicroseconds(40);   
  set_DAC_diff(dac_low_level);        //Set Low level of DAC for ambient cancellation

  ADC0.CTRLC = 82;                    //ADC ref back to VCC to sample the ambient(signal when leds off)
  ADC0.CTRLB = 0;                     //no accumulation of Samples
  ambient = analogRead(ITOV_PIN); 

  //for Red
  set_DAC_diff(dac_red_level);
  set_DAC(DAC_LED_REG,led_level_red);
  digitalWrite(RED_PULSE_PIN,HIGH);
  delayMicroseconds(100);
  
  red_itov = analogRead(ITOV_PIN); 
  ADC0.CTRLC = 66; 
  ADC0.CTRLB = 6;
  red_amp = analogRead(PPG_PIN);
  red_amp >>=3;
  digitalWrite(RED_PULSE_PIN,LOW);    
  delayMicroseconds(40);
  set_DAC_diff(dac_low_level); 

  //Serial.print("red ");
  //Serial.println(red_out);
  //Serial.print("ir ");
  //Serial.println(ir_out);
  
  //Filter the output sample
  ir_out  = low_pass_filter(ir_amp,ir_amp_prev,ir_out_prev);
  red_out = low_pass_filter(red_amp,red_amp_prev,red_out_prev);
  
  switch (state)
  {

    case 0: //Initialize variables

            ir_itov_max = 0,
            red_itov_max = 0,
            ir_itov_min = 1024,
            red_itov_min = 1024;
            state = 1; 
            now = millis()/1000;

            break;

    case 1: //calculate MAX/MIN of IR & Red to determine DC levels for difference stage.
            //find these for 500ms
            if(millis()/1000 < (now + 0.5))
            {
              if(ir_itov > ir_itov_max)
                ir_itov_max = ir_itov;

              if(ir_itov < ir_itov_min)
                ir_itov_min = ir_itov;

              if(red_itov < red_itov_min)
                red_itov_min = red_itov;

              if(red_itov > red_itov_max)
                red_itov_max = red_itov;
            }
            else
              state = 2;  
          
            break;
  
    case 2:
            //Vary Led intensity for maximum signal output and later perform amplification selection.
          {
            
            Serial.print("ir_itov_min:");
            Serial.println(ir_itov_min);
            Serial.print("red_itov_min:");
            Serial.println(red_itov_min);
            Serial.print("Ambient:");
            Serial.println(ambient);
            
            Serial.print("led_level_ir:");
            Serial.println(led_level_ir);
            Serial.print("led_level_red:");
            Serial.println(led_level_red);
            

            /*
            Set new Led drive control voltages for leds, Until:
            - Control voltage max out(200), OR
            - Signal's peak reaches a set threshold of 800.

            It is required to get max increase in signal peak at this stage
            for improved detection, there is amplification stage later, but it will increase noise also
            hence strategy is to drive leds for maximum signal output - avoiding opamp saturation
            so that minimum gain can be used in later stage for full ADC usage
            */
            if(!ir_led_set || !red_led_set)
            {
              /*Taking max level only till 200 as there will be 
              transistor saturation and less gain in intensity per voltage step.
              Also this saves time as loop can exit earlier.*/
              {
                if(ir_itov_max < 800 && led_level_ir < 200)
                {
                  led_level_ir += 5;
                }
                else
                  ir_led_set = 1;
              }
              {
                if(red_itov_max < 800 && led_level_red < 200)
                {
                  led_level_red += 15;
                }
                else
                  red_led_set = 1;
              }
              state = 0;
            }
            else
            {
              //Required intensity set! now set dc levels
              //Calculate dc levels for 8 bit dac.
              dac_ir_level = 256/(1024.0/(ir_itov_min));      
              dac_red_level = 256/(1024.0/(red_itov_min));

              //Serial.print("dac_ir_level:");
              //Serial.println(dac_ir_level);
              //Serial.print("dac_red_level:");
              //Serial.println(dac_red_level);

              //now determine Peak to Peak levels for PGA Gain selection
              uint16_t ir_itovpp = ir_itov_max - ir_itov_min;
              uint16_t red_itovpp = red_itov_max - red_itov_min;
              //take the max as that will determine headroom for amplification
              uint16_t maxpp = (ir_itovpp > red_itovpp) ? ir_itovpp:red_itovpp;
              //initaly gain value.
              uint8_t PGA_gain = 7;

              //Serial.print("maxpp:");
              //Serial.println(maxpp);

              //Loop and find maximum suitable gain value for set threshold
              for(int i=1;i<8;i++)
              {
                if(maxpp*i >= 250)    //approx 0.7V threshold, as ADCREF set 1.1V for actual signal.
                {                     //not going till 1.1, leaving some headroom
                  PGA_gain = i-1;
                  break;
                }
              }
              //Serial.print("Selected Gain ");
              //Serial.println(PGA_gain);

              //Once Gain determined, select lines go HIGH to set them.
              switch (PGA_gain)
              {
                case 1: //unity gain, do nothing
                        break;
                case 2:
                        digitalWrite(PGAI0,HIGH);
                        break;
                case 3:
                        digitalWrite(PGAI1,HIGH);
                        break;
                case 4:
                        digitalWrite(PGAI0,HIGH);
                        digitalWrite(PGAI1,HIGH);
                        break;
                case 5:
                        digitalWrite(PGAI2,HIGH);
                        break;
                case 6:
                        digitalWrite(PGAI0,HIGH);
                        digitalWrite(PGAI2,HIGH);
                        break;
                case 7:
                        digitalWrite(PGAI1,HIGH);
                        digitalWrite(PGAI2,HIGH);
                        break;
                default:
                        break;
              }

              state = 3;
              start_disp = 1;         //now start display
            }
          }
            break;

    case 3: /*
            Finds peaks/valley of IR and Red Signals for HR calculation
            Implemented MMPD algorithm to find peaks/valleys.

            Spo2 Calculation averaging based on weighted averaging method based on:
            PULSE OXIMETRY: ANALYSIS OF THEORY,TECHNOLO6Y, AND PRACTICE
            */

           //Find HR first.
          {  
            int8_t slope_red = red_out - red_out_prev;
            //find for Red
            {
              if(slope_red < 0)
              {
                if(!is_red_peak)
                  is_red_peak = 1;
                red_ctr++;                  
              }
              else
              {
                if(red_ctr >= red_comp)  
                {
                  red_comp = 0.6*red_ctr;
                  red_t = millis();
                  red_hr = (60000/(red_t - red_t_prev));
                  red_t_prev = red_t; 
                }
                red_ctr = 0;
                is_red_peak = 0;
              }
            }
            
            //find  for IR 
            int8_t slope_ir = ir_out - ir_out_prev;
            {
              if(slope_ir < 0)
              {
                if(!is_ir_peak)
                  is_ir_peak = 1;
                ir_ctr++;
              }
              else
              {
                if(ir_ctr >= ir_comp)
                {
                  ir_comp = 0.6*ir_ctr;
                  ir_t = millis();
                  ir_hr = (60000/(ir_t - ir_t_prev));
                  ir_t_prev = ir_t;                  
                }
                ir_ctr = 0;
                is_ir_peak = 0;
              }
            }

            //average ir and red found heart rates, average the result further.
            hr = (hr + (ir_hr + red_hr)/2)/2;
            
            //start Spo2 Calculation
            slope_red = abs(slope_red);
            slope_ir = abs(slope_ir);
          
            if(slope_ir!=0)
            {
              //calculate normalized ratio (R value)
              uint8_t ratio =  100*((1.0*slope_red*(ir_itov_min-ambient))/(slope_ir*(red_itov_min-ambient)));

              /*
              Standard formula is -25*R + 110. I increased constant value 
              to 116 as a "tweak", since i didn't had good narrow beam angle Leds,
              I had to use leds in diffused package and they will not give optimum results.
              this caused my ratios to appear around 0.6, hence the change in constant. 
              Using good high intensity narrow beam angle leds in clear package
              would give a nice ratio of 0.4.
              */
              //instantenous SpO2 of sample, using standard formula
              uint8_t spo2_i = (ratio > 44) ? ((-25 * ratio)/100 + 116) : 99;
              //finding SpO2 delta with current average to weight the samples
              uint8_t spo2_delta = abs(spo2_i - spo2_avg);

              //Assign weights for SAMP_N samples
              if(sample_n < SAMP_N)
              {
                if(spo2_delta > 30)
                {
                  spo2_wt[sample_n] = spo2_i*1;
                  wt[sample_n] = 1;
                }
                else if(spo2_delta > 20)
                {
                  spo2_wt[sample_n] = spo2_i*5;
                  wt[sample_n] = 5;
                }
                else if(spo2_delta > 15)
                {
                  spo2_wt[sample_n] = spo2_i*6;
                  wt[sample_n] = 6;
                }
                else if(spo2_delta > 10)
                {
                  spo2_wt[sample_n] = spo2_i*7;
                  wt[sample_n] = 7;
                }
                else if(spo2_delta > 7)
                {
                  spo2_wt[sample_n] = spo2_i*8;
                  wt[sample_n] = 8;
                }
                else if(spo2_delta > 3)
                {
                  spo2_wt[sample_n] = spo2_i*9;
                  wt[sample_n] = 9;
                }
                else
                {
                  spo2_wt[sample_n] = spo2_i*10;
                  wt[sample_n] = 10;
                }

                sample_n++;

              }
              //done with assigning weights, calc average
              else
              {

                uint32_t spo2_wt_sum = 0;uint8_t wt_sum = 0;

                for(int i=0;i<SAMP_N;i++)
                {
                  spo2_wt_sum += spo2_wt[i];
                  wt_sum += wt[i];

                }

                //weighted average of instantaneous samples.
                spo2_avg_in[spo2_ctr] = (spo2_wt_sum/wt_sum);

                //reset for next 20 samples
                spo2_wt[SAMP_N] = {0};
                wt[SAMP_N] = {0};
                sample_n = 0;   

                spo2_ctr++;
                //after 10 such iterations, calc average for final spo2.
                if(spo2_ctr == 10)
                {
                  uint16_t spo2_avg_in_sum = 0;

                  for(int i=0;i<SAMP_N/2;i++)
                  {
                    spo2_avg_in_sum += spo2_avg_in[i];
                  }

                  spo2_avg = spo2_avg_in_sum/(SAMP_N/2);    //update the average
                  spo2_avg = (spo2_avg > 99)? 99: spo2_avg; //limiting to 99.
                  spo2_avg_in[SAMP_N/2] = {0};
                  spo2_ctr = 0;
                  Serial.print("spo2_avg ");
                  Serial.println(spo2_avg);
                }//this average can be further averaged also, but not done in this implementation.
                //spo2_avg will be displayed on screen.             
              }
            }
          }
            break;

    default:
            break;
  }

  
  ir_out_prev = ir_out;
  red_out_prev = red_out;
  ir_amp_prev = ir_amp;
  red_amp_prev = red_amp;
  
  
  //Update Display every 3secs
  if(start_disp)
    if(now + 3 < millis()/1000)
    {

      char h_beat_str[4],spo2_str[3];
      if(hr > 99)
        sprintf(h_beat_str, "%d", hr);   
      else
        sprintf(h_beat_str, "0%d", hr); 

      sprintf(spo2_str, "%d", spo2_avg);

      ssd1306_clearScreen( );
      ssd1306_drawXBitmap(0, 0, 60, 24, spo2_logo);
      ssd1306_drawXBitmap(62, 0, 64, 28, bpm_logo);
      ssd1306_printFixed(0,35, spo2_str, STYLE_NORMAL);
      ssd1306_printFixed(56,35, h_beat_str, STYLE_NORMAL);
      
      now = millis()/1000;

    } 
}
