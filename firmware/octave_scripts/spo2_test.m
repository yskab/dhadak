#{
Takes ADC filtered samples from uC and applies spo2 algorithm to it
for demonstration and validation so that algorithm can be implemented
on microcontroller

test_spo2_* files under ADC_Samples have red and ir captured
samples from microcontroller
#}

clc;
clear;
pkg load signal
y = dlmread("ADC_Samples/test_spo2_7");

r_i = 1;
ir_i = 1;

for i=1:length(y)
  if(mod(i,2))
    red(r_i) = y(i);
    r_i++;
  else
    ir(ir_i) = y(i);
    ir_i++;
  endif
endfor

#just selecting the required array of sample value for analysis
ir = ir(200:6000);
red = red(200:6000);

#no floating point.
ir = floor(ir);
red = floor(red);

#display ir and red
#{
subplot(2,1,1)
plot(ir);
subplot(2,1,2)
plot(red);
#}

#detected DC values for R calculation, values present in
#end of test files
red_DC = 657;
ir_DC = 358;

avg_step = 30;    #number of samples to average the calculated weighted spo2
st = 1;           #start of sample
ed = avg_step;    #sample end
Avg_spo2 = 99;    #initial average
Avg_spo2_in = 99; #intermediate average
step = 1;         #step size for delta calculation

k=1;

for m=1:1:length(ir)/avg_step
  j=1;
  for i = st:step:ed-step
    ir_d = abs(ir(i+step) - ir(i));
    red_d = abs(red(i+step) - red(i));
   
    if(ir_d!=0)
      ratio(j) = (red_d*ir_DC)/(ir_d*red_DC);
      #{
      Standard formula is -25*R + 110. I increased constant value 
      to 115 as a "tweak", since i didn't had good narrow beam angle Leds,
      I had to use leds in diffused package and they will not give optimum results.
      this caused my ratios to appear around 0.6, hence the change in constant. 
      Using good high intensity narrow beam angle leds in clear package
      would give a nice ratio of 0.4.
      #}
      spo2(j) = -25*ratio(j) + 115;
      if(spo2(j) > 100)
        spo2(j) = 99;
      endif
   
      avg_diff = abs(spo2(j) - Avg_spo2);
      
      if(avg_diff > 30)
        wt(j) = 1;
        spwt(j) = spo2(j)*1;
      elseif(avg_diff > 20)
        wt(j) = 5;
        spwt(j) = spo2(j)*5;
      elseif(avg_diff > 15)
        wt(j) = 6;
        spwt(j) = spo2(j)*7;
      elseif(avg_diff > 10)
        wt(j) = 7;
        spwt(j) = spo2(j)*7;  
      elseif(avg_diff > 7)
        wt(j) = 8;
        spwt(j) = spo2(j)*8;     
      elseif(avg_diff > 3)
        wt(j) = 9;
        spwt(j) = spo2(j)*9;  
      else
        wt(j) = 10;
        spwt(j) = spo2(j)*10;
      endif
      
      j++;
      
    endif
    
  endfor

  spo2_calc = sum(spwt)/sum(wt);
  Avg_spo2_in(k) = spo2_calc;
  k++;
  st +=30;
  ed +=30;
  #if weighted average done for avg_step number of samples,
  #update the average and display so that is the actual spo2
  #and reset variables for next iteration
  if(!mod(m,avg_step))
    Avg_spo2 = mean(Avg_spo2_in)
    Avg_spo2_in=0;
    k=1;
  endif

endfor

#plot if required.

subplot(4,1,1)
plot(ir);
subplot(4,1,2)
plot(red);
subplot(4,1,3)
plot(ratio);
subplot(4,1,4)
plot(spo2);