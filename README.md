# Yam Drowning Detection And Prevention System

*Introduction*

This project aims to implement an IoT system that detect drowning incidents and respond quickly to prevent fatal incidents. The system will alert the supervisor through the integrated mobile application, if a person moves beside the edges of the pool using sensors around the pool. Moreover, the system will provide a wristband to measure the swimmers’ vitals and raise an alert if readings are beyond normal or expected. Furthermore, a net from within the pool will be raised to get the person above the water if any risky situation is anticipated.

----------------------------------------------------------------------------------------------------------

*Technologies*

The main languages used are: 

*Dart* for the mobile application which can be found in *Yam Application*. 

*Python* for the source code of the hardware, it can be found in *RaspberryPi.py*.

*C++* which is also the source code of the hardware, it can be found in *Arduino.ino*.

*JavaScript* which is the source code of the application deployed on fitbit in order send heart rate readings, it can be found in *Fitbit Heart App*


The main libraries used are: 

----------------------------------------------------------------------------------------------------------

*Launch*

Below is a Step-By-Step on how to configure the hardware.

*for the Arduino MEGA - LDR Connection Circuit*

![Uploading Screen Shot 2022-03-26 at 6.08.32 PM.png…]()

You Will Need:
*10K Ohm resistor.
*light dependent resistors (LDR).
*3 wires.

Assembly:
- Connect one of the photo-resistor leads to 5V power supply (RED Wire). And the other lead to the Arduino analog pin A10 to send the values (ORANGE Wire).
- Connect the photo-resistor lead to a 10KΩ resistor through the breadboard pins,
- Connect the lead of the 10KΩ resistor to the GND, the 10K Ω works as a pull-down resistor, as it pulls down all the current to the ground, to obtain a known output (BLACK Wire).

----------------------------------------------------------------------------------------------------------

*Water Quality Connection Circuit*
<img width="575" alt="Screen Shot 2022-03-26 at 6 20 14 PM" src="https://user-images.githubusercontent.com/93124382/160245992-1bfb2bb0-2354-4175-ade7-eb869b406925.png">

You Will Need:
*TDS (Water Quality Sensor)
*Wires

Assembly:
- Connect the Vin of the TDS sensor to the 5V pin in Arduino (RED Wire).
- Connect the GND of the TDS sensor to the GND pin in Arduino (BLACK Wire).
- Connect the data pin of the TDS sensor to analog pin (A0) in the Arduino (BLUE Wire).

----------------------------------------------------------------------------------------------------------

*pH Level Connection Circuit*

<img width="683" alt="Screen Shot 2022-03-26 at 6 20 50 PM" src="https://user-images.githubusercontent.com/93124382/160246010-5f553fa7-b0dd-4d7c-847b-64b86d52ea85.png">

You Will Need:
*PH level sensor 
*Wires

Assembly:
- Connect the Vin of the PH sensor to the 5V pin in Arduino (RED Wire).
- Connect the GND of the PH sensor to the GND pin in Arduino (BLACK Wire).
- Connect the data pin of the PH sensor to analog pin (A0) in the Arduino (BLUE Wire).


Lastly, run the script shown in *Arduino.ino* on Arduino MEGA.

----------------------------------------------------------------------------------------------------------

*for the Raspberry Pi*

![AllSystem copy](https://user-images.githubusercontent.com/93124382/160245501-118ea209-4d0f-40e9-9284-7c68f813566a.png)

You Will Need:
*Motor
*Wires

Assembly:
- Connect the power wire of the motor to the 5V pin in Raspberry Pi (BLUE Wire).
- Connect the data pin of the motor to GPIO pin in the Raspberry Pi (PURPLE Wire).



Lastly, Run the script shown in *RaspberryPi.py* on a RaspberryPi4





