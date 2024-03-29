
# धड़क\Dhadak - A Pulse Oximeter

<p align="middle">
  <img src="/images/top.jpg" width="200" height="200" />
  <img src="/images/side.jpg" width="200" height="200" /> 
  <img src="/images/front.jpg" width="200" height="200" />
</p>


* [Overview](#Overview)
* [Specifications](#Specifications)
* [Documentation](#Documentation)
* [Usage](#Usage)
* [Credits](#Credits)

## Overview

धड़क is a Pulse Oximeter which plugs onto a finger and measures
SpO<sub>2</sub>% and Heart rate of person.

<p align="center">
  <img src="https://github.com/yskab/dhadak/blob/main/images/demo.gif?raw=true" alt="spo2_gif"
width="300" height="190"/>
</p>

* Design doesn't use any specific oximeter sensor. A photodiode is used in the front end along with clean and amplify stages to obtain a suitable signal.

* ATmega4808 microcontroller is used in design along with QSB34CGR photodiode.

***Project Youtube video***

<div align="center">
  <a href="https://www.youtube.com/watch?v=QoOAn5z_qHc"><img src="/images/thumb.png" alt="Project Youtube video:"
  width="533" height="300"/></a>
</div>


It was quite difficult to build a device that would work accurately for all finger types. Still, there are issues/improvements which I could think of in design, code & enclosure. Hence I decided to create an improvements section in each specific readme for the project directory. Anyone interested in building this project can refer to it and create a better device.

## Specifications
* Runs on 2 AAA Batteries (MN2400).
* Takes 15 secs max to find parameters (can find earlier, depends on subject's skin as leds adjust intensity to obtain a good response).
* Max average current draw: 25mA( This is the maximum draw when leds at full brightness). As per battery's datasheet and minimum operating voltage of 2.7V, this would give a continuous operation time of 13hrs. 
* 3 sec display update rate.
* Battery percentage indicator.
* Snap-fit enclosure with spring mechanism which ensures good firm contact of finger with photodiode.
* Soft latch power On/Off main button.
* 17KB Flash memory usage.

## Documentation

Complete understanding document detailing the overview, circuit design, block diagrams, and algorithm is available below for 2 languages:

[हिंदी दस्तावेज़](https://github.com/yskab/dhadak/blob/main/doc/hi/dhadak_hi.pdf)

[English doc](https://github.com/yskab/dhadak/blob/main/doc/en/dhadak_en.pdf)

## Usage
Repository Structure:

* **dhadak:** KiCAD Project files for v1.
* **dhadak_v2:** KiCAD Project files for v2.
* **doc:** Contains source for documentation.
* **enclosure:** FreeCAD project file.
* **firmware:** Source code.
* **images:** Device Images.
* **references:** PDF documents which were used as a reference to create the project.


Device was built as per KiCAD project: /dhadak. During testing, I later discovered that some things were simply not required to be added in design, so I desoldered certain circuit sections, amended the design, and wrote updated code/documentation around it. 

If you wish to build this device, please refer /dhadak_v2 project, it has the updated final schematics as per amendments in v1. Though PCB design was not done for this updated version, you can use the schematics present in the directory and build a PCB for it. Changes/amendments from v1 are mention in /dhadak_v2/readme.

### Programming Device

* For ATmega4808 first burn fuse to change clock to internal 8MHz.

* Proceed with code upload.

* Insert finger and press power button, wait for values to appear.

Please ensure to use good leds recommended for oximetry. I worked with generic ir & red leds which are used for indication applications hence SpO<sub>2</sub> was not quite accurate (as a healthy individual I should have got readings around 97+ but used to get around 90. This is the reason a small scaling factor has been added in code to compensate and calculate higher reading). These indication LEDs should not be used for oximeter. For best response, ensure LEDs have:

* Narrow view angle for less dispersion and deeper penetration into the skin.
* Rectangular package in the clear lens so that finger can rest comfortably.
* High radiant power.
	
A suitable choice can be Vishay Semiconductor's VSMD66694 or any other equivalent.


## Credits

**OLED Library:** ssd1306 by lexus2k

https://github.com/lexus2k/ssd1306

**OLED Images:** bmp2hex by Robert Gallup

https://github.com/robertgallup/python-bmp2hex

**Heart rate Algorithm:**

ArgÃijello-Prada, Erick Javier. The mountaineer’s method for
peak detection in photoplethysmographic signals. Revista Facul-
tad De Ingenieria-universidad De Antioquia 2018 (2019): 42-50

https://api.semanticscholar.org/CorpusID:116767900

**SpO<sub>2</sub> Algorithm:**
 

Michael W. Wukitsch, BA,Michael T. Petterson, BA, RRT, CPFT,
David R. Tobler, BSEE,and Jonas A. Pologe, BSEE
PULSE OXIMETRY: ANALYSIS OF THEORY, TECHNOLOGY, AND PRACTICE

https://link.springer.com/article/10.1007%2FBF01617328

All application notes/papers consulted in design can be found in the references directory.

## License
MIT License

Copyright (c) 2021 Y S K Abhijeet

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
