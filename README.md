
# धड़क\Dhadak - A Pulse Oximeter

<p align="middle">
  <img src="https://github.com/yskab/dhadak/blob/main/images/top.jpg?raw=true" width="200" height="200" />
  <img src="https://github.com/yskab/dhadak/blob/main/images/side.jpg?raw=true" width="250" height="200" /> 
</p>


* [Overview](#Overview)
* [Specifications](#Specifications)
* [Documentation](#Documentation)
* [Usage](#Usage)
* [Credits](#Credits)

## Overview

<p align="center">
  <img src="https://github.com/yskab/dhadak/blob/main/doc/common/logo.png?raw=true" width="160" height="110" /> 
</p>

धड़क is a Pulse Oximeter which plugs onto a finger and measures
SpO<sub>2</sub>% and Heart rate of person.

<p align="center">
  <img src="https://github.com/yskab/dhadak/blob/main/images/demo.gif?raw=true" alt="animated"
width="300" height="190"/>
</p>

* Design dosen't use any specific oximeter sensor. A photodiode is used in front end along with clean and amplify stages to obtain a suitable signal.

* ATmega4808 microcontroller is used in design along with QSB34CGR photodiode.

Project Youtube video:



It was quite difficult to build a device that would work accurately for all finger types. Still there are issues/improvments which i could think of in design, code & enclosure. Hence I decided to create an improvements section in each specific readme for the project directory. Anyone interested in building this project can refer it and create a better device.

## Specifications
* Runs on 2 AAA Batteries (MN2400).
* Takes 15 secs max to find parameters (can find earlier, depends on subject's skin as leds adjust intensity to obtain a good response).
* Max average current draw: 25mA( This is the maximum draw when leds at full brightness). As per battery's datasheet and minimum operating voltage of 2.7V, this would give continuous operation time of 13hrs. 
* 5 sec display update rate.
* Battery percentage indicator.
* Snapfit enclosure with spring mechanism in enclosure ensures good firm contact of finger with photodiode.
* Soft latch power On/Off main button.
* 17KB Flash memory usage.

## Documentation

Complete understanding document detailing the overview, circuit design, block diagrams and algorithm is available below for 2 languages:
[हिन्दी](https://github.com/yskab/dhadak/blob/main/doc/hi/dhadak_hi.pdf)
[English](https://github.com/yskab/dhadak/blob/main/doc/en/dhadak_en.pdf)

## Usage
Repository Structure:

* **dhadak:** KiCAD Project files for v1.
* **dhadak_v2:** KiCAD Project files for v2.
* **doc:** Contains $\TeX$ source for documentation.
* **enclosure:** FreeCAD project file.
* **firmware:** Source code.
* **images:** Device Images.
* **references:** PDF documents which were used as reference to create the project.


Device was built as per KiCAD project: /dhadak. During testing, I later discovered that some things were simply not required to be added in design, so i desoldered certain circuit sections and amended the design and wrote updated code/documentation around it. 

If you wish to build this device, please refer /dhadak_v2 project, it has the updated final schematics as per amendments in v1. Though PCB design was not done for this updated version , you can use the schematics present in directory and build a PCB for it. Changes/amendments from v1 are mention in /dhadak_v2/readme.

* For a new ATmega4808 first burn fuse to change clock to internal 8MHz.

* Proceed with code upload.

Please ensure to use good leds recommended for oximetry. I worked with generic ir & red leds which are used for indication application hence SpO<sub>2</sub> was not quite accurate (as a healthy individual i should have got readings around 97+ but used to get around 85-90. This is the reason a small scaling factor has been added in code to compensate and calculate higher reading). These indication leds should not be used for oximeter. For best response ensure leds have:

* Narrow view angle for less dispersion and deeper penetration into skin.
* Rectangular package in clear lens so that finger can rest comfortably.
* High radiant power.
	
A suitable choice can be Vishay Semiconductor's VSMD66694 or any other equivalent.


## Credits

**OLED Library**
ssd1306 by lexus2k
https://github.com/lexus2k/ssd1306

**OLED Images**
bmp2hex by Robert Gallup
https://github.com/robertgallup/python-bmp2hex

**Heart rate Algorithm:**

ArgÃijello-Prada, Erick Javier. The mountaineer’s method for
peak detection in photoplethysmographic signals. Revista Facul-
tad De Ingenieria-universidad De Antioquia 2018 (2019): 42-50
https://api.semanticscholar.org/CorpusID:116767900

**SpO<sub>2</sub> Algorithm:**
 

Michael W. Wukitsch, BA,Michael T. Petterson, BA, RRT, CPFT,
David R. Tobler, BSEE,and Jonas A. Pologe, BSEE
PULSE OXIMETRY: ANALYSIS OF THEORY,TECHNOLO6Y, AND PRACTICE
https://link.springer.com/article/10.1007%2FBF01617328

All application notes/papers consulted in design can be found in references directory.

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

