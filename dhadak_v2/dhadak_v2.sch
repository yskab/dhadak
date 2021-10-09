EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Dhadak Oximeter"
Date "2021-10-09"
Rev "2"
Comp ""
Comment1 "Made by: Y S K Abhijeet"
Comment2 "https://github.com/yskab/dhadak"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 6148CCC6
P 5950 4400
AR Path="/60F31C2B/6148CCC6" Ref="Q?"  Part="1" 
AR Path="/6148CCC6" Ref="Q2"  Part="1" 
AR Path="/614602B8/6148CCC6" Ref="Q?"  Part="1" 
F 0 "Q2" H 6141 4446 50  0000 L CNN
F 1 "BC847" H 6141 4355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6150 4500 50  0001 C CNN
F 3 "~" H 5950 4400 50  0001 C CNN
	1    5950 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CCCC
P 6050 5000
AR Path="/60F31C2B/6148CCCC" Ref="#PWR?"  Part="1" 
AR Path="/6148CCCC" Ref="#PWR010"  Part="1" 
AR Path="/614602B8/6148CCCC" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 6050 4750 50  0001 C CNN
F 1 "GND" V 6055 4872 50  0000 R CNN
F 2 "" H 6050 5000 50  0001 C CNN
F 3 "" H 6050 5000 50  0001 C CNN
	1    6050 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6148CCD2
P 5350 3750
AR Path="/60F31C2B/6148CCD2" Ref="R?"  Part="1" 
AR Path="/6148CCD2" Ref="R2"  Part="1" 
AR Path="/614602B8/6148CCD2" Ref="R?"  Part="1" 
F 0 "R2" V 5555 3750 50  0000 C CNN
F 1 "4.7K" V 5464 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5390 3740 50  0001 C CNN
F 3 "~" H 5350 3750 50  0001 C CNN
	1    5350 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6148CCD8
P 6700 3750
AR Path="/60F31C2B/6148CCD8" Ref="R?"  Part="1" 
AR Path="/6148CCD8" Ref="R5"  Part="1" 
AR Path="/614602B8/6148CCD8" Ref="R?"  Part="1" 
F 0 "R5" V 6905 3750 50  0000 C CNN
F 1 "4.7K" V 6814 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6740 3740 50  0001 C CNN
F 3 "~" H 6700 3750 50  0001 C CNN
	1    6700 3750
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 6148CCDE
P 6350 3750
AR Path="/60F31C2B/6148CCDE" Ref="Q?"  Part="1" 
AR Path="/6148CCDE" Ref="Q3"  Part="1" 
AR Path="/614602B8/6148CCDE" Ref="Q?"  Part="1" 
F 0 "Q3" H 6541 3796 50  0000 L CNN
F 1 "BC847" H 6100 3900 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6550 3850 50  0001 C CNN
F 3 "~" H 6350 3750 50  0001 C CNN
	1    6350 3750
	-1   0    0    -1  
$EndComp
Text Label 5600 3400 2    50   ~ 0
RED_CATHODE
Text Label 6550 3400 0    50   ~ 0
IR_CATHODE
Wire Wire Line
	6250 3550 6250 3400
Wire Wire Line
	5800 3550 5800 3400
Wire Wire Line
	5600 3400 5800 3400
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 6148CCE9
P 5700 3750
AR Path="/60F31C2B/6148CCE9" Ref="Q?"  Part="1" 
AR Path="/6148CCE9" Ref="Q1"  Part="1" 
AR Path="/614602B8/6148CCE9" Ref="Q?"  Part="1" 
F 0 "Q1" H 5891 3796 50  0000 L CNN
F 1 "BC847" H 5450 3900 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5900 3850 50  0001 C CNN
F 3 "~" H 5700 3750 50  0001 C CNN
	1    5700 3750
	1    0    0    -1  
$EndComp
Text Label 5450 4400 2    50   ~ 0
DAC_LED
Wire Wire Line
	6050 4600 6050 4700
$Comp
L Device:R_US R?
U 1 1 6148CCF1
P 6050 4850
AR Path="/60F31C2B/6148CCF1" Ref="R?"  Part="1" 
AR Path="/6148CCF1" Ref="R4"  Part="1" 
AR Path="/614602B8/6148CCF1" Ref="R?"  Part="1" 
F 0 "R4" V 6150 4850 50  0000 C CNN
F 1 "20" V 5936 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6090 4840 50  0001 C CNN
F 3 "~" H 6050 4850 50  0001 C CNN
	1    6050 4850
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6148CCF7
P 5600 4400
AR Path="/60F31C2B/6148CCF7" Ref="R?"  Part="1" 
AR Path="/6148CCF7" Ref="R3"  Part="1" 
AR Path="/614602B8/6148CCF7" Ref="R?"  Part="1" 
F 0 "R3" V 5395 4400 50  0000 C CNN
F 1 "4.7K" V 5486 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5640 4390 50  0001 C CNN
F 3 "~" H 5600 4400 50  0001 C CNN
	1    5600 4400
	0    1    1    0   
$EndComp
Text GLabel 5200 3750 0    50   Input ~ 0
RED_PULSE
Text GLabel 6850 3750 2    50   Input ~ 0
IR_PULSE
Wire Notes Line style solid
	750  700  4200 700 
Wire Notes Line style solid
	4650 700  7400 700 
Wire Notes Line style solid
	7400 2850 4650 2850
Text Notes 5550 2800 0    98   ~ 0
Test Points
Wire Notes Line style solid
	4650 700  4650 2850
Wire Notes Line style solid
	7400 700  7400 2850
Wire Wire Line
	8150 4050 8400 4050
$Comp
L Device:R_US R?
U 1 1 6148CD06
P 8350 4450
AR Path="/60F31C2B/6148CD06" Ref="R?"  Part="1" 
AR Path="/6148CD06" Ref="R6"  Part="1" 
AR Path="/614602B8/6148CD06" Ref="R?"  Part="1" 
F 0 "R6" V 8555 4450 50  0000 C CNN
F 1 "100K" V 8464 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8390 4440 50  0001 C CNN
F 3 "~" H 8350 4450 50  0001 C CNN
	1    8350 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8500 4450 8600 4450
Wire Wire Line
	8600 4450 8600 4350
Wire Wire Line
	8150 4450 8200 4450
Wire Wire Line
	8150 4050 8150 4450
$Comp
L power:GND #PWR?
U 1 1 6148CD10
P 8600 5400
AR Path="/60F31C2B/6148CD10" Ref="#PWR?"  Part="1" 
AR Path="/6148CD10" Ref="#PWR017"  Part="1" 
AR Path="/614602B8/6148CD10" Ref="#PWR?"  Part="1" 
F 0 "#PWR017" H 8600 5150 50  0001 C CNN
F 1 "GND" H 8605 5227 50  0000 C CNN
F 2 "" H 8600 5400 50  0001 C CNN
F 3 "" H 8600 5400 50  0001 C CNN
	1    8600 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6148CD16
P 8600 4700
AR Path="/60F31C2B/6148CD16" Ref="R?"  Part="1" 
AR Path="/6148CD16" Ref="R7"  Part="1" 
AR Path="/614602B8/6148CD16" Ref="R?"  Part="1" 
F 0 "R7" H 8668 4746 50  0000 L CNN
F 1 "100K" H 8668 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8640 4690 50  0001 C CNN
F 3 "~" H 8600 4700 50  0001 C CNN
	1    8600 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4550 8600 4450
Connection ~ 8600 4450
Wire Wire Line
	9000 4050 9000 4550
Wire Wire Line
	8600 4850 8600 4900
Wire Wire Line
	9000 4850 9000 5100
Wire Wire Line
	9000 5100 8900 5100
$Comp
L Switch:SW_SPST SW?
U 1 1 6148CD23
P 9750 4750
AR Path="/60F31C2B/6148CD23" Ref="SW?"  Part="1" 
AR Path="/6148CD23" Ref="SW1"  Part="1" 
AR Path="/614602B8/6148CD23" Ref="SW?"  Part="1" 
F 0 "SW1" H 9750 4985 50  0000 C CNN
F 1 "SW_PWR" H 9750 4894 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 9750 4750 50  0001 C CNN
F 3 "https://www.sunrom.com/m/4917" H 9750 4750 50  0001 C CNN
	1    9750 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 6148CD29
P 9400 5250
AR Path="/6148CD29" Ref="C7"  Part="1" 
AR Path="/5FA16378/6148CD29" Ref="C?"  Part="1" 
AR Path="/5FE1F0AB/6148CD29" Ref="C?"  Part="1" 
AR Path="/606BED55/6148CD29" Ref="C?"  Part="1" 
AR Path="/60F31C2B/6148CD29" Ref="C?"  Part="1" 
AR Path="/614602B8/6148CD29" Ref="C?"  Part="1" 
F 0 "C7" H 9515 5296 50  0000 L CNN
F 1 "0.1u" H 9515 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9438 5100 50  0001 C CNN
F 3 "~" H 9400 5250 50  0001 C CNN
	1    9400 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CD2F
P 9400 5400
AR Path="/60F31C2B/6148CD2F" Ref="#PWR?"  Part="1" 
AR Path="/6148CD2F" Ref="#PWR019"  Part="1" 
AR Path="/614602B8/6148CD2F" Ref="#PWR?"  Part="1" 
F 0 "#PWR019" H 9400 5150 50  0001 C CNN
F 1 "GND" H 9405 5227 50  0000 C CNN
F 2 "" H 9400 5400 50  0001 C CNN
F 3 "" H 9400 5400 50  0001 C CNN
	1    9400 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CD35
P 10050 5400
AR Path="/60F31C2B/6148CD35" Ref="#PWR?"  Part="1" 
AR Path="/6148CD35" Ref="#PWR020"  Part="1" 
AR Path="/614602B8/6148CD35" Ref="#PWR?"  Part="1" 
F 0 "#PWR020" H 10050 5150 50  0001 C CNN
F 1 "GND" H 10055 5227 50  0000 C CNN
F 2 "" H 10050 5400 50  0001 C CNN
F 3 "" H 10050 5400 50  0001 C CNN
	1    10050 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 6148CD3B
P 10600 4750
AR Path="/6148CD3B" Ref="C8"  Part="1" 
AR Path="/5FA16378/6148CD3B" Ref="C?"  Part="1" 
AR Path="/5FE1F0AB/6148CD3B" Ref="C?"  Part="1" 
AR Path="/606BED55/6148CD3B" Ref="C?"  Part="1" 
AR Path="/60F31C2B/6148CD3B" Ref="C?"  Part="1" 
AR Path="/614602B8/6148CD3B" Ref="C?"  Part="1" 
F 0 "C8" H 10715 4796 50  0000 L CNN
F 1 "10u" H 10715 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10638 4600 50  0001 C CNN
F 3 "~" H 10600 4750 50  0001 C CNN
	1    10600 4750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CD41
P 10750 4750
AR Path="/60F31C2B/6148CD41" Ref="#PWR?"  Part="1" 
AR Path="/6148CD41" Ref="#PWR022"  Part="1" 
AR Path="/614602B8/6148CD41" Ref="#PWR?"  Part="1" 
F 0 "#PWR022" H 10750 4500 50  0001 C CNN
F 1 "GND" V 10755 4622 50  0000 R CNN
F 2 "" H 10750 4750 50  0001 C CNN
F 3 "" H 10750 4750 50  0001 C CNN
	1    10750 4750
	1    0    0    -1  
$EndComp
Text Label 8150 4050 2    50   ~ 0
BATT
Text Label 10450 4300 0    50   ~ 0
BATT
Text Notes 8500 6200 0    98   ~ 0
Soft Latch Power On-Off
Wire Wire Line
	8600 5300 8600 5400
Wire Wire Line
	10050 5300 10050 5400
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 6148CD4C
P 8700 5100
AR Path="/60F31C2B/6148CD4C" Ref="Q?"  Part="1" 
AR Path="/6148CD4C" Ref="Q5"  Part="1" 
AR Path="/614602B8/6148CD4C" Ref="Q?"  Part="1" 
F 0 "Q5" H 8891 5146 50  0000 L CNN
F 1 "BC847" H 8891 5055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8900 5200 50  0001 C CNN
F 3 "~" H 8700 5100 50  0001 C CNN
	1    8700 5100
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 6148CD52
P 9950 5100
AR Path="/60F31C2B/6148CD52" Ref="Q?"  Part="1" 
AR Path="/6148CD52" Ref="Q7"  Part="1" 
AR Path="/614602B8/6148CD52" Ref="Q?"  Part="1" 
F 0 "Q7" H 10141 5146 50  0000 L CNN
F 1 "BC847" H 10141 5055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10150 5200 50  0001 C CNN
F 3 "~" H 9950 5100 50  0001 C CNN
	1    9950 5100
	1    0    0    -1  
$EndComp
Text Label 10300 1800 0    50   ~ 0
DAC_SCL
Text Label 10300 1700 0    50   ~ 0
DAC_SDA
Text Label 8750 2000 2    50   ~ 0
DAC_LED
$Comp
L power:GND #PWR?
U 1 1 6148CD5B
P 10300 2000
AR Path="/60F31C2B/6148CD5B" Ref="#PWR?"  Part="1" 
AR Path="/6148CD5B" Ref="#PWR021"  Part="1" 
AR Path="/614602B8/6148CD5B" Ref="#PWR?"  Part="1" 
F 0 "#PWR021" H 10300 1750 50  0001 C CNN
F 1 "GND" H 10305 1827 50  0000 C CNN
F 2 "" H 10300 2000 50  0001 C CNN
F 3 "" H 10300 2000 50  0001 C CNN
	1    10300 2000
	1    0    0    -1  
$EndComp
Wire Notes Line style solid
	7850 6250 10850 6250
Wire Notes Line style solid
	7850 3050 10850 3050
$Comp
L Device:C C?
U 1 1 6148CD63
P 8750 1550
AR Path="/60F31C2B/6148CD63" Ref="C?"  Part="1" 
AR Path="/6148CD63" Ref="C6"  Part="1" 
AR Path="/614602B8/6148CD63" Ref="C?"  Part="1" 
F 0 "C6" H 8865 1596 50  0000 L CNN
F 1 "10u" H 8865 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8788 1400 50  0001 C CNN
F 3 "~" H 8750 1550 50  0001 C CNN
	1    8750 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CD69
P 8750 1400
AR Path="/60F31C2B/6148CD69" Ref="#PWR?"  Part="1" 
AR Path="/6148CD69" Ref="#PWR018"  Part="1" 
AR Path="/614602B8/6148CD69" Ref="#PWR?"  Part="1" 
F 0 "#PWR018" H 8750 1150 50  0001 C CNN
F 1 "GND" H 8755 1227 50  0000 C CNN
F 2 "" H 8750 1400 50  0001 C CNN
F 3 "" H 8750 1400 50  0001 C CNN
	1    8750 1400
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 6148CD6F
P 8450 2250
AR Path="/60F31C2B/6148CD6F" Ref="C?"  Part="1" 
AR Path="/6148CD6F" Ref="C5"  Part="1" 
AR Path="/614602B8/6148CD6F" Ref="C?"  Part="1" 
F 0 "C5" H 8565 2296 50  0000 L CNN
F 1 "0.1u" H 8565 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8488 2100 50  0001 C CNN
F 3 "~" H 8450 2250 50  0001 C CNN
	1    8450 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6148CD75
P 8200 2250
AR Path="/60F31C2B/6148CD75" Ref="C?"  Part="1" 
AR Path="/6148CD75" Ref="C3"  Part="1" 
AR Path="/614602B8/6148CD75" Ref="C?"  Part="1" 
F 0 "C3" H 8000 2300 50  0000 L CNN
F 1 "0.1u" H 7950 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8238 2100 50  0001 C CNN
F 3 "~" H 8200 2250 50  0001 C CNN
	1    8200 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CD7B
P 8450 2400
AR Path="/60F31C2B/6148CD7B" Ref="#PWR?"  Part="1" 
AR Path="/6148CD7B" Ref="#PWR016"  Part="1" 
AR Path="/614602B8/6148CD7B" Ref="#PWR?"  Part="1" 
F 0 "#PWR016" H 8450 2150 50  0001 C CNN
F 1 "GND" H 8455 2227 50  0000 C CNN
F 2 "" H 8450 2400 50  0001 C CNN
F 3 "" H 8450 2400 50  0001 C CNN
	1    8450 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CD81
P 8200 2400
AR Path="/60F31C2B/6148CD81" Ref="#PWR?"  Part="1" 
AR Path="/6148CD81" Ref="#PWR014"  Part="1" 
AR Path="/614602B8/6148CD81" Ref="#PWR?"  Part="1" 
F 0 "#PWR014" H 8200 2150 50  0001 C CNN
F 1 "GND" H 8205 2227 50  0000 C CNN
F 2 "" H 8200 2400 50  0001 C CNN
F 3 "" H 8200 2400 50  0001 C CNN
	1    8200 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6148CD87
P 10250 1300
AR Path="/6175E549/6148CD87" Ref="R?"  Part="1" 
AR Path="/6148CD87" Ref="R10"  Part="1" 
AR Path="/60F31C2B/6148CD87" Ref="R?"  Part="1" 
AR Path="/614602B8/6148CD87" Ref="R?"  Part="1" 
F 0 "R10" V 10045 1300 50  0000 C CNN
F 1 "4.7K" V 10136 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 10290 1290 50  0001 C CNN
F 3 "~" H 10250 1300 50  0001 C CNN
	1    10250 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6148CD8D
P 10250 1000
AR Path="/6175E549/6148CD8D" Ref="R?"  Part="1" 
AR Path="/6148CD8D" Ref="R9"  Part="1" 
AR Path="/60F31C2B/6148CD8D" Ref="R?"  Part="1" 
AR Path="/614602B8/6148CD8D" Ref="R?"  Part="1" 
F 0 "R9" V 10045 1000 50  0000 C CNN
F 1 "4.7K" V 10136 1000 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 10290 990 50  0001 C CNN
F 3 "~" H 10250 1000 50  0001 C CNN
	1    10250 1000
	0    1    1    0   
$EndComp
Text Label 10400 1300 0    50   ~ 0
DAC_SDA
Text Label 10400 1000 0    50   ~ 0
DAC_SCL
Text GLabel 10000 1000 0    50   Input ~ 0
VCC
Wire Wire Line
	10100 1300 10100 1000
NoConn ~ 9000 1800
Wire Notes Line style solid
	10850 700  10850 2850
Wire Notes Line style solid
	7850 2850 7850 700 
Text Notes 8850 2800 0    98   ~ 0
Dual 8 bit DAC
Wire Notes Line style solid
	7850 2850 10850 2850
Wire Notes Line style solid
	7850 700  10850 700 
Wire Wire Line
	10000 1000 10100 1000
Connection ~ 10100 1000
Text GLabel 9550 4050 2    50   Output ~ 0
VCC
Wire Notes Line style solid
	10850 3050 10850 6250
Wire Notes Line style solid
	7850 3050 7850 6250
NoConn ~ 10300 1900
Wire Wire Line
	9950 4750 10050 4750
Connection ~ 10050 4750
Wire Wire Line
	10050 4750 10050 4900
Wire Wire Line
	10050 4750 10150 4750
$Comp
L Device:R_US R?
U 1 1 6148CDA7
P 10300 4300
AR Path="/60F31C2B/6148CDA7" Ref="R?"  Part="1" 
AR Path="/6148CDA7" Ref="R11"  Part="1" 
AR Path="/614602B8/6148CDA7" Ref="R?"  Part="1" 
F 0 "R11" H 10500 4250 50  0000 R CNN
F 1 "576K" H 10550 4350 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 10340 4290 50  0001 C CNN
F 3 "~" H 10300 4300 50  0001 C CNN
	1    10300 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6148CDAD
P 9000 4700
AR Path="/60F31C2B/6148CDAD" Ref="R?"  Part="1" 
AR Path="/6148CDAD" Ref="R8"  Part="1" 
AR Path="/614602B8/6148CDAD" Ref="R?"  Part="1" 
F 0 "R8" H 9068 4746 50  0000 L CNN
F 1 "100K" H 9068 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9040 4690 50  0001 C CNN
F 3 "~" H 9000 4700 50  0001 C CNN
	1    9000 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6148CDB3
P 10300 4750
AR Path="/60F31C2B/6148CDB3" Ref="R?"  Part="1" 
AR Path="/6148CDB3" Ref="R12"  Part="1" 
AR Path="/614602B8/6148CDB3" Ref="R?"  Part="1" 
F 0 "R12" V 10505 4750 50  0000 C CNN
F 1 "10K" V 10414 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 10340 4740 50  0001 C CNN
F 3 "~" H 10300 4750 50  0001 C CNN
	1    10300 4750
	0    -1   -1   0   
$EndComp
Text GLabel 8200 1700 0    50   Input ~ 0
VCC
Connection ~ 8750 1700
Wire Wire Line
	8750 1700 9000 1700
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6148CDBC
P 5600 7350
AR Path="/60F31C2B/6148CDBC" Ref="#FLG?"  Part="1" 
AR Path="/6148CDBC" Ref="#FLG01"  Part="1" 
AR Path="/614602B8/6148CDBC" Ref="#FLG?"  Part="1" 
F 0 "#FLG01" H 5600 7425 50  0001 C CNN
F 1 "PWR_FLAG" H 5600 7550 50  0000 C CNN
F 2 "" H 5600 7350 50  0001 C CNN
F 3 "~" H 5600 7350 50  0001 C CNN
	1    5600 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CDC2
P 5600 7350
AR Path="/60F31C2B/6148CDC2" Ref="#PWR?"  Part="1" 
AR Path="/6148CDC2" Ref="#PWR09"  Part="1" 
AR Path="/614602B8/6148CDC2" Ref="#PWR?"  Part="1" 
F 0 "#PWR09" H 5600 7100 50  0001 C CNN
F 1 "GND" H 5605 7177 50  0000 C CNN
F 2 "" H 5600 7350 50  0001 C CNN
F 3 "" H 5600 7350 50  0001 C CNN
	1    5600 7350
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6148CDC8
P 6050 7350
AR Path="/60F31C2B/6148CDC8" Ref="#FLG?"  Part="1" 
AR Path="/6148CDC8" Ref="#FLG02"  Part="1" 
AR Path="/614602B8/6148CDC8" Ref="#FLG?"  Part="1" 
F 0 "#FLG02" H 6050 7425 50  0001 C CNN
F 1 "PWR_FLAG" H 6050 7550 50  0000 C CNN
F 2 "" H 6050 7350 50  0001 C CNN
F 3 "~" H 6050 7350 50  0001 C CNN
	1    6050 7350
	1    0    0    -1  
$EndComp
Text Label 6050 7350 3    50   ~ 0
BATT
Text GLabel 6500 7350 3    50   Input ~ 0
VCC
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6148CDD0
P 6500 7350
AR Path="/60F31C2B/6148CDD0" Ref="#FLG?"  Part="1" 
AR Path="/6148CDD0" Ref="#FLG03"  Part="1" 
AR Path="/614602B8/6148CDD0" Ref="#FLG?"  Part="1" 
F 0 "#FLG03" H 6500 7425 50  0001 C CNN
F 1 "PWR_FLAG" H 6500 7550 50  0000 C CNN
F 2 "" H 6500 7350 50  0001 C CNN
F 3 "~" H 6500 7350 50  0001 C CNN
	1    6500 7350
	1    0    0    -1  
$EndComp
$Sheet
S 1700 6350 1550 950 
U 6148CDD2
F0 "Front End" 118
F1 "AFE.sch" 118
$EndSheet
Wire Wire Line
	6250 3400 6550 3400
Wire Wire Line
	5800 3950 6050 3950
Connection ~ 6050 3950
Wire Wire Line
	6050 3950 6250 3950
$Comp
L Device:C C?
U 1 1 6148CDE2
P 8350 1550
AR Path="/60F31C2B/6148CDE2" Ref="C?"  Part="1" 
AR Path="/6148CDE2" Ref="C4"  Part="1" 
AR Path="/614602B8/6148CDE2" Ref="C?"  Part="1" 
F 0 "C4" H 8465 1596 50  0000 L CNN
F 1 "0.1u" H 8465 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8388 1400 50  0001 C CNN
F 3 "~" H 8350 1550 50  0001 C CNN
	1    8350 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CDE8
P 8350 1400
AR Path="/60F31C2B/6148CDE8" Ref="#PWR?"  Part="1" 
AR Path="/6148CDE8" Ref="#PWR015"  Part="1" 
AR Path="/614602B8/6148CDE8" Ref="#PWR?"  Part="1" 
F 0 "#PWR015" H 8350 1150 50  0001 C CNN
F 1 "GND" H 8355 1227 50  0000 C CNN
F 2 "" H 8350 1400 50  0001 C CNN
F 3 "" H 8350 1400 50  0001 C CNN
	1    8350 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 1700 8350 1700
Wire Wire Line
	8350 1700 8750 1700
Connection ~ 8350 1700
Wire Wire Line
	8450 2000 9000 2000
Wire Wire Line
	8200 2100 8200 1900
Text GLabel 8800 1800 0    50   Output ~ 0
DAC_DIFF
$Comp
L mcp47:MCP47FEB02A0-E_ST IC?
U 1 1 6148CDFC
P 9000 1700
AR Path="/60F31C2B/6148CDFC" Ref="IC?"  Part="1" 
AR Path="/6148CDFC" Ref="IC1"  Part="1" 
AR Path="/614602B8/6148CDFC" Ref="IC?"  Part="1" 
F 0 "IC1" H 9650 1965 50  0000 C CNN
F 1 "MCP47FEB02A0-E_ST" H 9650 1874 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 10150 1800 50  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en573220" H 10150 1700 50  0001 L CNN
F 4 "DAC 8-Bit 2-Ch I2C 8-Pin TSSOP Microchip MCP47FEB02A0-E/ST, 2-channel 8 bit Serial DAC, 8-Pin TSSOP" H 10150 1600 50  0001 L CNN "Description"
F 5 "1.2" H 10150 1500 50  0001 L CNN "Height"
F 6 "Microchip" H 10150 1400 50  0001 L CNN "Manufacturer_Name"
F 7 "MCP47FEB02A0-E/ST" H 10150 1300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "579-MCP47FEB02A0EST" H 10150 1200 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Microchip-Technology/MCP47FEB02A0-E-ST?qs=rQCxX1QmdjKDJonwz1QvmA%3D%3D" H 10150 1100 50  0001 L CNN "Mouser Price/Stock"
F 10 "MCP47FEB02A0-E/ST" H 10150 1000 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/mcp47feb02a0-est/microchip-technology" H 10150 900 50  0001 L CNN "Arrow Price/Stock"
	1    9000 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2000 8450 2100
Wire Wire Line
	8800 4050 9000 4050
Connection ~ 9400 5100
Wire Wire Line
	9400 5100 9400 4750
Wire Wire Line
	9400 4750 9550 4750
Wire Wire Line
	9400 5100 9750 5100
Text Label 1950 1550 1    50   ~ 0
RXD
Text Label 1850 1550 1    50   ~ 0
TXD
$Comp
L power:GND #PWR?
U 1 1 6148CE14
P 3600 4200
AR Path="/60F31C2B/6148CE14" Ref="#PWR?"  Part="1" 
AR Path="/6148CE14" Ref="#PWR06"  Part="1" 
AR Path="/614602B8/6148CE14" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 3600 3950 50  0001 C CNN
F 1 "GND" H 3600 4050 50  0000 C CNN
F 2 "" H 3600 4200 50  0001 C CNN
F 3 "" H 3600 4200 50  0001 C CNN
	1    3600 4200
	-1   0    0    -1  
$EndComp
Text GLabel 3600 4000 0    50   Input ~ 0
VCC
$Comp
L power:GND #PWR?
U 1 1 6148CE1B
P 2400 4200
AR Path="/60F31C2B/6148CE1B" Ref="#PWR?"  Part="1" 
AR Path="/6148CE1B" Ref="#PWR04"  Part="1" 
AR Path="/614602B8/6148CE1B" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 2400 3950 50  0001 C CNN
F 1 "GND" H 2400 4050 50  0000 C CNN
F 2 "" H 2400 4200 50  0001 C CNN
F 3 "" H 2400 4200 50  0001 C CNN
	1    2400 4200
	1    0    0    -1  
$EndComp
Text Label 2400 3900 2    50   ~ 0
UPDI_DATA
Text Label 3600 3800 2    50   ~ 0
RED_CATHODE
Text Label 3600 3900 2    50   ~ 0
IR_CATHODE
Text Label 3350 4100 2    50   ~ 0
BATT
Connection ~ 1200 2150
Wire Wire Line
	1200 2150 1200 2050
Connection ~ 1200 2050
Text GLabel 1000 2050 1    50   Input ~ 0
VCC
Wire Wire Line
	1000 2050 1200 2050
Wire Wire Line
	1200 2150 1450 2150
$Comp
L power:GND #PWR?
U 1 1 6148CE2B
P 2400 4950
AR Path="/60F31C2B/6148CE2B" Ref="#PWR?"  Part="1" 
AR Path="/6148CE2B" Ref="#PWR05"  Part="1" 
AR Path="/614602B8/6148CE2B" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 2400 4700 50  0001 C CNN
F 1 "GND" H 2405 4777 50  0000 C CNN
F 2 "" H 2400 4950 50  0001 C CNN
F 3 "" H 2400 4950 50  0001 C CNN
	1    2400 4950
	1    0    0    -1  
$EndComp
Text GLabel 2400 4850 0    50   Input ~ 0
PD_CATHODE
Text GLabel 1350 4100 0    50   Input ~ 0
VCC
Text Label 1350 4000 2    50   ~ 0
OLED_SCL
Text Label 1350 3900 2    50   ~ 0
OLED_SDA
Wire Wire Line
	1200 2050 1450 2050
Text Label 2050 2750 3    50   ~ 0
OLED_SDA
Text Label 2150 2750 3    50   ~ 0
OLED_SCL
Text GLabel 2750 2750 3    50   Input ~ 0
ITOV
Text GLabel 2250 2750 3    50   Output ~ 0
IR_PULSE
Text GLabel 2250 1550 1    50   Output ~ 0
RED_PULSE
Text Notes 1650 5650 0    98   ~ 0
ATmega4808 Connections
Text Label 1650 2750 3    50   ~ 0
UPDI_DATA
NoConn ~ 1950 2750
$Comp
L power:GND #PWR?
U 1 1 6148CE41
P 1200 1750
AR Path="/60F31C2B/6148CE41" Ref="#PWR?"  Part="1" 
AR Path="/6148CE41" Ref="#PWR01"  Part="1" 
AR Path="/614602B8/6148CE41" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 1200 1500 50  0001 C CNN
F 1 "GND" H 1205 1577 50  0000 C CNN
F 2 "" H 1200 1750 50  0001 C CNN
F 3 "" H 1200 1750 50  0001 C CNN
	1    1200 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 6148CE47
P 1200 1900
AR Path="/60F31C2B/6148CE47" Ref="C?"  Part="1" 
AR Path="/6148CE47" Ref="C1"  Part="1" 
AR Path="/614602B8/6148CE47" Ref="C?"  Part="1" 
F 0 "C1" H 1315 1946 50  0000 L CNN
F 1 "0.1u" H 1315 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1238 1750 50  0001 C CNN
F 3 "~" H 1200 1900 50  0001 C CNN
	1    1200 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CE4D
P 3650 2000
AR Path="/60F31C2B/6148CE4D" Ref="#PWR?"  Part="1" 
AR Path="/6148CE4D" Ref="#PWR07"  Part="1" 
AR Path="/614602B8/6148CE4D" Ref="#PWR?"  Part="1" 
F 0 "#PWR07" H 3650 1750 50  0001 C CNN
F 1 "GND" H 3655 1827 50  0000 C CNN
F 2 "" H 3650 2000 50  0001 C CNN
F 3 "" H 3650 2000 50  0001 C CNN
	1    3650 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 6148CE53
P 1200 2300
AR Path="/60F31C2B/6148CE53" Ref="C?"  Part="1" 
AR Path="/6148CE53" Ref="C2"  Part="1" 
AR Path="/614602B8/6148CE53" Ref="C?"  Part="1" 
F 0 "C2" H 1000 2350 50  0000 L CNN
F 1 "0.1u" H 950 2250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1238 2150 50  0001 C CNN
F 3 "~" H 1200 2300 50  0001 C CNN
	1    1200 2300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CE59
P 1200 2450
AR Path="/60F31C2B/6148CE59" Ref="#PWR?"  Part="1" 
AR Path="/6148CE59" Ref="#PWR02"  Part="1" 
AR Path="/614602B8/6148CE59" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 1200 2200 50  0001 C CNN
F 1 "GND" H 1205 2277 50  0000 C CNN
F 2 "" H 1200 2450 50  0001 C CNN
F 3 "" H 1200 2450 50  0001 C CNN
	1    1200 2450
	1    0    0    -1  
$EndComp
Text Label 2150 1550 1    50   ~ 0
DAC_SCL
Text Label 2050 1550 1    50   ~ 0
DAC_SDA
$Comp
L power:GND #PWR?
U 1 1 6148CE61
P 1350 4200
AR Path="/60F31C2B/6148CE61" Ref="#PWR?"  Part="1" 
AR Path="/6148CE61" Ref="#PWR03"  Part="1" 
AR Path="/614602B8/6148CE61" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 1350 3950 50  0001 C CNN
F 1 "GND" H 1355 4027 50  0000 C CNN
F 2 "" H 1350 4200 50  0001 C CNN
F 3 "" H 1350 4200 50  0001 C CNN
	1    1350 4200
	1    0    0    -1  
$EndComp
Wire Notes Line style solid
	750  5700 4200 5700
Wire Notes Line style solid
	4200 700  4200 5700
Text Label 2400 4000 2    50   ~ 0
RST
Text GLabel 2400 4100 0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 6148CE6B
P 2600 4850
F 0 "J3" H 2680 4842 50  0000 L CNN
F 1 "PD_PORT" V 2850 4650 50  0000 L CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 2600 4850 50  0001 C CNN
F 3 "~" H 2600 4850 50  0001 C CNN
	1    2600 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 6148CE71
P 2600 4000
F 0 "J2" H 2680 3992 50  0000 L CNN
F 1 "PROG_PORT" V 2850 3750 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2600 4000 50  0001 C CNN
F 3 "~" H 2600 4000 50  0001 C CNN
	1    2600 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 6148CE77
P 1550 4000
F 0 "J1" H 1630 3992 50  0000 L CNN
F 1 "OLED_PORT" V 1800 3750 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 1550 4000 50  0001 C CNN
F 3 "~" H 1550 4000 50  0001 C CNN
	1    1550 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 6148CE7D
P 3800 4000
F 0 "J4" H 3880 4042 50  0000 L CNN
F 1 "EXT_PORT" V 4050 3850 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3800 4000 50  0001 C CNN
F 3 "~" H 3800 4000 50  0001 C CNN
	1    3800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4100 3600 4100
Wire Wire Line
	3650 2000 3650 2150
Wire Notes Line style solid
	4650 3050 7400 3050
Wire Notes Line style solid
	4650 5700 7400 5700
Text Notes 5300 5650 0    59   ~ 0
LED Anodes are connected to VCC
Text Notes 4950 5500 0    98   ~ 0
Voltage Controlled LED Driver
Wire Notes Line style solid
	7400 3050 7400 5700
Wire Notes Line style solid
	4650 3050 4650 5700
Wire Notes Line style solid
	750  6000 4200 6000
Wire Notes Line style solid
	4200 6000 4200 7600
Wire Notes Line style solid
	4200 7600 750  7600
Wire Notes Line style solid
	750  7600 750  6000
Wire Wire Line
	8200 1900 8900 1900
Wire Wire Line
	8800 1800 8900 1800
Wire Wire Line
	8900 1800 8900 1900
Connection ~ 8900 1900
Wire Wire Line
	8900 1900 9000 1900
NoConn ~ 2450 1550
NoConn ~ 2550 1550
$Comp
L Device:R_US R?
U 1 1 6148CEA4
P 2550 3050
AR Path="/6175E549/6148CEA4" Ref="R?"  Part="1" 
AR Path="/6148CEA4" Ref="R1"  Part="1" 
AR Path="/60F31C2B/6148CEA4" Ref="R?"  Part="1" 
AR Path="/614602B8/6148CEA4" Ref="R?"  Part="1" 
F 0 "R1" V 2650 3050 50  0000 C CNN
F 1 "4.7K" V 2450 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2590 3040 50  0001 C CNN
F 3 "~" H 2550 3050 50  0001 C CNN
	1    2550 3050
	1    0    0    -1  
$EndComp
Text GLabel 2550 3300 2    50   Input ~ 0
VCC
Wire Wire Line
	2450 2750 2550 2750
Wire Wire Line
	2550 2750 2550 2900
Wire Wire Line
	2550 3200 2550 3300
NoConn ~ 2350 1550
NoConn ~ 1850 2750
Text Label 2550 2800 3    50   ~ 0
RST
NoConn ~ 2350 2750
Wire Wire Line
	6600 2350 6700 2350
Wire Wire Line
	6600 2100 6700 2100
Wire Wire Line
	6600 1500 6700 1500
Wire Wire Line
	6600 1250 6700 1250
Wire Wire Line
	6700 1000 6600 1000
$Comp
L power:GND #PWR?
U 1 1 6148CEBA
P 6600 2350
AR Path="/60F31C2B/6148CEBA" Ref="#PWR?"  Part="1" 
AR Path="/6148CEBA" Ref="#PWR013"  Part="1" 
AR Path="/614602B8/6148CEBA" Ref="#PWR?"  Part="1" 
F 0 "#PWR013" H 6600 2100 50  0001 C CNN
F 1 "GND" H 6605 2177 50  0000 C CNN
F 2 "" H 6600 2350 50  0001 C CNN
F 3 "" H 6600 2350 50  0001 C CNN
	1    6600 2350
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP12
U 1 1 6148CEC0
P 6700 2350
F 0 "TP12" H 6758 2468 50  0000 L CNN
F 1 "GND" H 6758 2377 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6900 2350 50  0001 C CNN
F 3 "~" H 6900 2350 50  0001 C CNN
	1    6700 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP11
U 1 1 6148CEC6
P 6700 2100
F 0 "TP11" H 6758 2218 50  0000 L CNN
F 1 "GND" H 6758 2127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6900 2100 50  0001 C CNN
F 3 "~" H 6900 2100 50  0001 C CNN
	1    6700 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CECC
P 6600 2100
AR Path="/60F31C2B/6148CECC" Ref="#PWR?"  Part="1" 
AR Path="/6148CECC" Ref="#PWR012"  Part="1" 
AR Path="/614602B8/6148CECC" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H 6600 1850 50  0001 C CNN
F 1 "GND" H 6605 1927 50  0000 C CNN
F 2 "" H 6600 2100 50  0001 C CNN
F 3 "" H 6600 2100 50  0001 C CNN
	1    6600 2100
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 6148CEE0
P 6700 1000
F 0 "TP7" H 6758 1118 50  0000 L CNN
F 1 "TP_RED_PULSE" H 6758 1027 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6900 1000 50  0001 C CNN
F 3 "~" H 6900 1000 50  0001 C CNN
	1    6700 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 6148CEE6
P 6700 1500
F 0 "TP9" H 6758 1618 50  0000 L CNN
F 1 "TP_DAC_DIFF" H 6758 1527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6900 1500 50  0001 C CNN
F 3 "~" H 6900 1500 50  0001 C CNN
	1    6700 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 6148CEEC
P 6700 1250
F 0 "TP8" H 6758 1368 50  0000 L CNN
F 1 "TP_IR_PULSE" H 6758 1277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6900 1250 50  0001 C CNN
F 3 "~" H 6900 1250 50  0001 C CNN
	1    6700 1250
	1    0    0    -1  
$EndComp
Text GLabel 6600 1250 0    50   Output ~ 0
IR_PULSE
Text GLabel 6600 1000 0    50   Output ~ 0
RED_PULSE
Text GLabel 6600 1500 0    50   Output ~ 0
DAC_DIFF
Text GLabel 5250 1800 0    50   Output ~ 0
ITOV
$Comp
L Connector:TestPoint TP4
U 1 1 6148CEF9
P 5350 1800
F 0 "TP4" H 5408 1918 50  0000 L CNN
F 1 "TP_ITOV" H 5408 1827 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5550 1800 50  0001 C CNN
F 3 "~" H 5550 1800 50  0001 C CNN
	1    5350 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 6148CF0B
P 5350 2100
F 0 "TP5" H 5408 2218 50  0000 L CNN
F 1 "TP_TXD" H 5408 2127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5550 2100 50  0001 C CNN
F 3 "~" H 5550 2100 50  0001 C CNN
	1    5350 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 6148CF11
P 5350 2350
F 0 "TP6" H 5408 2468 50  0000 L CNN
F 1 "TP_RXD" H 5408 2377 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5550 2350 50  0001 C CNN
F 3 "~" H 5550 2350 50  0001 C CNN
	1    5350 2350
	1    0    0    -1  
$EndComp
Text Label 5250 2100 2    50   ~ 0
TXD
Text Label 5250 2350 2    50   ~ 0
RXD
$Comp
L Connector:TestPoint TP10
U 1 1 6148CF19
P 6700 1800
F 0 "TP10" H 6758 1918 50  0000 L CNN
F 1 "GND" H 6758 1827 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6900 1800 50  0001 C CNN
F 3 "~" H 6900 1800 50  0001 C CNN
	1    6700 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6148CF1F
P 6600 1800
AR Path="/60F31C2B/6148CF1F" Ref="#PWR?"  Part="1" 
AR Path="/6148CF1F" Ref="#PWR011"  Part="1" 
AR Path="/614602B8/6148CF1F" Ref="#PWR?"  Part="1" 
F 0 "#PWR011" H 6600 1550 50  0001 C CNN
F 1 "GND" H 6605 1627 50  0000 C CNN
F 2 "" H 6600 1800 50  0001 C CNN
F 3 "" H 6600 1800 50  0001 C CNN
	1    6600 1800
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 6148CF25
P 5350 1000
F 0 "TP1" H 5408 1118 50  0000 L CNN
F 1 "TP_AMP" H 5408 1027 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5550 1000 50  0001 C CNN
F 3 "~" H 5550 1000 50  0001 C CNN
	1    5350 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1000 5250 1000
Wire Wire Line
	5350 1800 5250 1800
Wire Wire Line
	5350 2100 5250 2100
Wire Wire Line
	5350 2350 5250 2350
Wire Wire Line
	6600 1800 6700 1800
Wire Notes Line style solid
	750  700  750  5700
Wire Wire Line
	6050 3950 6050 4200
NoConn ~ 2750 1550
Text GLabel 5250 1000 0    50   Input ~ 0
PPG
Wire Wire Line
	5250 1500 5350 1500
$Comp
L power:GND #PWR?
U 1 1 6167C578
P 5250 1500
AR Path="/60F31C2B/6167C578" Ref="#PWR?"  Part="1" 
AR Path="/6167C578" Ref="#PWR08"  Part="1" 
AR Path="/614602B8/6167C578" Ref="#PWR?"  Part="1" 
F 0 "#PWR08" H 5250 1250 50  0001 C CNN
F 1 "GND" H 5255 1327 50  0000 C CNN
F 2 "" H 5250 1500 50  0001 C CNN
F 3 "" H 5250 1500 50  0001 C CNN
	1    5250 1500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 6167C57E
P 5350 1500
F 0 "TP3" H 5408 1618 50  0000 L CNN
F 1 "GND" H 5408 1527 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5550 1500 50  0001 C CNN
F 3 "~" H 5550 1500 50  0001 C CNN
	1    5350 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 6167C584
P 5350 1250
F 0 "TP2" H 5408 1368 50  0000 L CNN
F 1 "TP_DIFF_OUT" H 5408 1277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5550 1250 50  0001 C CNN
F 3 "~" H 5550 1250 50  0001 C CNN
	1    5350 1250
	1    0    0    -1  
$EndComp
Text GLabel 5250 1250 0    50   Input ~ 0
DIFF_OUT
Wire Wire Line
	5250 1250 5350 1250
$Comp
L Device:Q_PNP_BEC Q4
U 1 1 6168EAF9
P 8600 4150
F 0 "Q4" V 8928 4150 50  0000 C CNN
F 1 "BC857" V 8837 4150 50  0000 C CNN
F 2 "" H 8800 4250 50  0001 C CNN
F 3 "~" H 8600 4150 50  0001 C CNN
	1    8600 4150
	0    1    -1   0   
$EndComp
$Comp
L Device:Q_NMOS_GSD Q6
U 1 1 61695651
P 9350 3750
F 0 "Q6" H 9554 3796 50  0000 L CNN
F 1 "SI2304" H 9554 3705 50  0000 L CNN
F 2 "" H 9550 3850 50  0001 C CNN
F 3 "~" H 9350 3750 50  0001 C CNN
	1    9350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4050 9450 3950
Wire Wire Line
	9550 4050 9450 4050
Wire Wire Line
	9000 5100 9400 5100
Connection ~ 9000 5100
Wire Wire Line
	10050 4300 10150 4300
Wire Wire Line
	10050 4300 10050 4750
Text Label 9450 3550 2    50   ~ 0
BATT
Wire Wire Line
	9150 3750 9000 3750
Wire Wire Line
	9000 3750 9000 4050
Connection ~ 9000 4050
Text GLabel 3050 2750 3    50   Input ~ 0
PPG
NoConn ~ 3050 1550
NoConn ~ 2950 1550
NoConn ~ 2850 1550
NoConn ~ 2850 2750
NoConn ~ 2950 2750
NoConn ~ 3150 2750
Text GLabel 3250 2750 3    50   Input ~ 0
PGAI0
Text GLabel 3350 2750 3    50   Input ~ 0
PGAI1
Text GLabel 3450 2750 3    50   Input ~ 0
PGAI2
$Comp
L MCU_Microchip_ATmega:ATmega4808-A U?
U 1 1 6156FE6D
P 2550 2150
AR Path="/60F31C2B/6156FE6D" Ref="U?"  Part="1" 
AR Path="/6156FE6D" Ref="U2"  Part="1" 
AR Path="/614602B8/6156FE6D" Ref="U?"  Part="1" 
F 0 "U2" H 2550 961 50  0000 C CNN
F 1 "ATmega4808-A" H 2550 870 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 2550 2150 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40002017A.pdf" H 2550 2150 50  0001 C CNN
	1    2550 2150
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
