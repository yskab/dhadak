***src/main.cpp*** - source code

***src/bitmap.h*** - bitmap array of displayed images

***lib/ssd1306*** - ssd1306 library - https://github.com/lexus2k/ssd1306

Upload and device options configured in platformio.ini

Memory Usage:

RAM: 7.2% (used 441 bytes from 6144 bytes)

Flash: 35.3% (used 17327 bytes from 49152 bytes)

## Suggested Improvements

* Design can be comfortably completed on a 32KB flash device including any additional improvements. I had 10 units of ATmega4808, hence used it.

* Microseconds Delay in main loop sets the per-sample frequency (red and ir signal frequency) at around 500Hz. This is not a suitable approach, a better approach is to use timers, but I decided not to as it just worked fine.

* There is a slight step in the DAC Diff square wave signal before and after the sample signal. This is happening because DAC is called twice in a short interval( first to set diff level and then to set led brightness). This causes DACs diff output to add that slight step, though it's outside the signal, still a better approach is to improve the design and remove the step completely.

<p align="middle">
  <img src="/doc/common/circuit/DAC_step.png"/>
</p>

* Additional Algorithm can be implemented to take care of any motion-related errors.

* Generated diff signal can be made adaptable with I to V signal so that any slight variation in finger pressure or signal wobble, a new diff signal is immediately calculated and subtracted.

* Oled Updates values in real-time.
