This project has the updated v2 schematics. As mentioned in project readme, PCB was not designed, PCB in v1 was amended to this schematic, so the actual code and documentation refers to this design. Changes in this schematics when compared with v1:

* Increased Transimpedance Stage resistance to 576K. 200K was a bit lower, it is important to get good response at this stage, hence resistor was doubled.

* All resistors in difference amplifier changed to 10K. There is no need to have gain here. Fixed ADC ref at 1.1V and with oversampling, response is quite good. Amplification can be added later in PGA.

* Remove isolation stage completely. No requirement to have separate isolation and Gain stages.

* A Singe PGA stage is added, so any gain is applied equally to both red and ir.

* For a Quad opamp package, 1 opamp was left, so used it as a buffer.

* Removed R7 in series with infrared led. No need to limit ir current.

* 10u Bypass Cap on DAC didn't made any difference in ringing, maybe it can be removed.

* Improved the Soft-latch circuit. Earlier Latch output Vcc was being used direclty to power things. Since there are individual bypass capacitors also connected to DAC, ATmega, opamp, On to Off state was not working as the bypass capacitors were charged keeping the latch always turned On. In amended design, Latch is completely local and mosfet output drives Vcc, so latch can turn Off comfortably.

## Suggested Improvements
* A better layout for I2C signals.
* Better bypasssing of DAC, there was slight ringing at the edges, hence had to use a small delay before and after the waveform so that it no spikes at difference amplifier output edges.
* 50Hz line interference visible, though it gets filtered by digital filter, maybe a filter can be added to remove it from input signal itself.
* Since Enclosure size was made as per battery lengths, PCB should dimensions should have been increased, allowing all the parts to fit in back, this would have allow easy reflow and no hand soldering.

## Credits

* Latch circuit taken reference from user Sam Raja's comment under EEVblog's Video:

[EEVblog #262 - World's Simplest Soft Latching Power Switch Circuit](https://youtu.be/Foc9R0dC2iI)


