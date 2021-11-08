/* 0- General */

    int decimalPrecision = 2;               // decimal places for all values shown in LED Display & Serial Monitor


 
    int ThermistorPin = A8;                 // The analog input pin for measuring temperature
    float voltageDividerR1 = 10000;         // Resistor value in R1 for voltage devider method 
    float BValue = 3470;                    // The B Value of the thermistor for the temperature measuring range
    float R1 = 5000;                        // Thermistor resistor rating at based temperature (25 degree celcius)
    float T1 = 298.15;                      /* Base temperature T1 in Kelvin (default should be at 25 degree)*/
    float R2 ;                              /* Resistance of Thermistor (in ohm) at Measuring Temperature*/
    float T2 ;                              /* Measurement temperature T2 in Kelvin */
    
    float a ;                               /* Use for calculation in Temperature*/
    float b ;                               /* Use for calculation in Temperature*/
    float c ;                               /* Use for calculation in Temperature*/
    float d ;                               /* Use for calculation in Temperature*/
    float e = 2.718281828 ;                 /* the value of e use for calculation in Temperature*/
    
    float tempSampleRead  = 0;               /* to read the value of a sample including currentOffset1 value*/
    float tempLastSample  = 0;               /* to count time for each sample. Technically 1 milli second 1 sample is taken */
    float tempSampleSum   = 0;               /* accumulation of sample readings */
    float tempSampleCount = 0;               /* to count number of sample. */
    float tempMean ;                         /* to calculate the average value from all samples, in analog values*/ 


//Water Quality TDS 
    #include "GravityTDS.h"

    #define TdsSensorPin A9
    GravityTDS gravityTds;

    float tdsValue = 0;

//pH Level

    #define SensorPin A10         // the pH meter Analog output is connected with the Arduino’s Analog
    unsigned long int avgValue;  //Store the average value of the sensor feedback
    int buf[10],temp;

// LDR Pins
    const int LDR0 = A0;
    const int LDR1 = A1;
    const int LDR2 = A2;
    const int LDR3 = A3;
    const int LDR4 = A4;
    const int LDR5 = A5;
    const int LDR6 = A6;
    const int LDR7 = A7;

//tree1//
int input_val1 = 0;
int input_val2 = 0;
String ldr1str = "ldr1";
String ldr2str = "ldr2";

//tree2//
int input_val3 = 0;
int input_val4 = 0;
String ldr3str = "ldr3";
String ldr4str = "ldr4";

//tree3//
int input_val5 = 0;
int input_val6 = 0;
String ldr5str = "ldr5";
String ldr6str = "ldr6";

//tree4//
int input_val7 = 0;
int input_val8 = 0;
String ldr7str = "ldr7";
String ldr8str = "ldr8";


void setup() {
  gravityTds.setPin(TdsSensorPin);
  gravityTds.setAref(5.0); //reference voltage on ADC, default 5.0V on Arduino UNO
  gravityTds.setAdcRange(1024); //1024 for 10bit ADC;4096 for 12bit ADC
  gravityTds.begin(); //initialization
  Serial.begin(9600);

}

void loop() {
  
    /* 1- Temperature Measurement */

    if(millis() >= tempLastSample + 1)                                                                  /* every 1 milli second taking 1 reading */
        {
            tempSampleRead = analogRead(ThermistorPin);                                                 /* read analog value from sensor */
            tempSampleSum = tempSampleSum+tempSampleRead;                                               /* add all analog value for averaging later*/
            tempSampleCount = tempSampleCount+1;                                                        /* keep counting the sample quantity*/
            tempLastSample = millis();                                                                  /* reset the time in order to repeat the loop again*/
        }

    if(tempSampleCount == 1000)                                                                         /* after 10 sample readings taken*/
        {
            tempMean = tempSampleSum / tempSampleCount;                                                 /* find the average analog value from those data*/
            R2 = (voltageDividerR1*tempMean)/(1023-tempMean);                                           /* convert the average analog value to resistance value*/
    
            a = 1/T1;                                                                                   /* use for calculation */
            b = log10(R1/R2);                                                                           /* use for calculation */
            c = b / log10(e);                                                                           /* use for calculation */
            d = c / BValue ;                                                                            /* use for calculation */
            T2 = 1 / (a- d);
            double T3 = T2-273.15;
            String T = "Temp";
            String Temp = T+T3;                                                                                            /* the measured temperature value based on calculation (in Kelvin) */
            Serial.println(Temp);                                                 /* display in Serial monitor the temperature in Celcius*/
            
            
            tempSampleSum = 0;                                                                          /* reset all the total analog value back to 0 for the next count */
            tempSampleCount = 0;                                                                        /* reset the total number of samples taken back to 0 for the next count*/
        
    

    //tree1//
  input_val1 = analogRead(LDR0);
  String ldr1val = ldr1str + input_val1;
  Serial.println(ldr1val);
    delay(100);

  input_val2 = analogRead(LDR1);
  String ldr2val = ldr2str + input_val2;
  Serial.println(ldr2val);
   delay(100);


  //tree2//
  input_val3 = analogRead(LDR2);
  String ldr3val = ldr3str + input_val3;
  Serial.println(ldr3val);
    delay(100);

  input_val4 = analogRead(LDR3);
  String ldr4val = ldr4str + input_val4;
  Serial.println(ldr4val);
    delay(100);

  //tree3//
  input_val5 = analogRead(LDR4);
  String ldr5val = ldr5str + input_val5;
  Serial.println(ldr5val);
    delay(100);

  input_val6 = analogRead(LDR5);
  String ldr6val = ldr6str + input_val6;
  Serial.println(ldr6val);
    delay(100);

  //tree4//
  input_val7 = analogRead(LDR6);
  String ldr7val = ldr7str + input_val7;
  Serial.println(ldr7val);
    delay(100);

  input_val8 = analogRead(LDR7);
  String ldr8val = ldr8str + input_val8;
  Serial.println(ldr8val);
    delay(100);

//Water Quality Measurment 

gravityTds.update();                               //sample and calculate
tdsValue = gravityTds.getTdsValue();              // then get the value
        
String TDS = "TDS";
String tdsLevel = TDS+tdsValue;
        
Serial.println(tdsLevel);



//Water pH Level
for(int i=0;i<10;i++)                            //Get 10 sample value from the sensor for smooth the value
  { 
    buf[i]=analogRead(SensorPin);
    delay(10);
  }
 
  
  avgValue=0;
  for(int i=2;i<8;i++)                         //take the average value of 6 center sample
    avgValue+=buf[i];
  float phVolt=(float)avgValue*5.0/1024/10;   //convert the analog into millivolt
  float phValue=-5.7*phVolt+21.34;            //convert the millivolt into pH value
  
  String pH = "pH";
  String pHLevel = pH+phValue;   
  
  Serial.println(pHLevel);
        }
      

}
