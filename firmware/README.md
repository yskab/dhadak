src/main.cpp - source code
src/bitmap.h - bitmap array of displayed images
lib/ssd1306 - ssd1306 library - https://github.com/lexus2k/ssd1306

Upload and device options configured in platformio.ini

Memory Usage:

RAM:   [=         ]   7.2% (used 441 bytes from 6144 bytes)
Flash: [====      ]  35.3% (used 17327 bytes from 49152 bytes)

## Suggested Improvements

* Design can be comfortably completed on a 32KB flash including any additional improvments. I had 10 units of ATmega4808, hence used it.

* Microseconds Delay in main loop sets the per sample frequency (red and ir signal frequency) at around 500Hz. This is not a suitable approach, better approach is to use timers, but i decided not to as it just worked fine.

* There is a slight step in DAC Diff signal before and after the sample signal. This is happenning because i am calling the dac twice in a short interval( first to set diff level and then to set led brightnesss). This causes DACs diff output to add that slight step, though it's outside the signal, still a better approach is to make it sort of adaptable.

* Algorithm can be implemented to take care of motion related errors.

* Generated diff signal can be made adaptable with diff signal so that any slight variation in finger pressure or signal wobble, a new diff signal is immediately calculated.

* Oled Updates in real-time.

