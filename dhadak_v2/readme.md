This KiCAD directory has the updated v2 schematics. PCB was not designed, PCB in v1 was amended to this schematic, so the actual code and documentation refer to this design. Changes in this schematics, when compared with v1, are:

* Increased Transimpedance Stage resistance to 576K. 200K was a bit lower, it is important to get a good response at this stage, hence the resistor was doubled.

* All resistors in difference amplifier changed to 10K. There is no need to have gain here. Fixed ADC ref at 1.1V and with oversampling, the response is quite good. Amplification can be added later in PGA.

* Removed isolation stage completely. No requirement to have separate isolation and Gain stages.

* A Single PGA stage is added, so any gain is applied equally to both red and ir.

* For a Quad opamp package, 1 opamp was left, so used it as a buffer.

* Removed R7 in series with infrared led. No need to limit ir current.

* 10u Bypass Cap on DAC didn't make any difference in ringing, removed it.

* Improved the Soft-latch circuit. Earlier Latch output was being used directly as Vcc. Since there are individual bypass capacitors also connected to DAC, ATmega, opamp, On to Off state was not working as the bypass capacitors were charged keeping the latch always turned On. In amended design, latch is completely local and Mosfet output drives Vcc, so latch can turn Off comfortably.

## Suggested Improvements
* A better PCB layout for I2C signals.
* Better bypassing of DAC, there was slight ringing at the edges, hence had to use a small delay before and after the waveform so that no spikes get included in difference amplifier output edges.

<p align="middle">
  <img src="/doc/common/circuit/ringing.png"/>
</p>

* 50Hz line interference visible, though it gets filtered by IIR filter in the microcontroller, maybe a filter can be added to remove it from input signal itself.

<p align="middle">
  <img src="/doc/common/circuit/50_hum.png"/>
</p>

* Enclosure size was made as per battery lengths, PCB dimension could have been increased, allowing all the parts to fit in back, this would allow easy reflow of the backside and no hand soldering.

## Credits

* Latch circuit is taken from user Sam Raja's comment under EEVblog's Video: [EEVblog #262 - World's Simplest Soft Latching Power Switch Circuit](https://youtu.be/Foc9R0dC2iI)
