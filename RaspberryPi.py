#!/usr/bin/env python3
import paho.mqtt.client as mqtt
import time, random
from gpiozero import LightSensor,Buzzer
from time import sleep
import RPi.GPIO as GPIO
import serial
import requests
from subprocess import call

# client, user and device details
serverUrl   = "mqtt.cumulocity.com"
clientId    = "HanaR"
device_name = "Yam-v1"
tenant      = "iotccis21"
username    = "439202914@student.ksu.edu.sa"
password    = "hanaABDULLAH1"

receivedMessages = []


GPIO.setmode(GPIO.BCM)
GPIO.setup(14, GPIO.OUT)



ldr1 = 0
ldr2 = 0
ldr3 = 0
ldr4 = 0
ldr5 = 0
ldr6 = 0
ldr7 = 0
ldr8 = 0

url = "https://yam-project-2021-default-rtdb.firebaseio.com/WaterQuality.json"

# display all incoming messages
def on_message(client, userdata, message):
    print("Received operation " + str(message.payload))
    payload = message.payload.decode("utf-8")
    #print(payload)
    operation = payload [10:]
    print(operation)
    if(operation == 'ON'):
      GPIO.output(14, GPIO.HIGH)
      time.sleep(5)
      GPIO.output(14, GPIO.LOW)
    if(operation == 'Pause'):
    	call("sudo shutdown -h now", shell=True)


    time.sleep(2)

# send measurement
def sendMeasurements():

	if __name__ == '__main__':
			ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)
			# 1 not swimming 0 swimming
			swim = 1
			while True:
					GPIO.output(14, GPIO.LOW)
					sleep(0.1)
					publish("s/us", "200,c8y_AdultSwimming,AdultSwimming," + str(swim))
					SPO2 = random.randint(90, 95)
					publish("s/us", "200,c8y_SPO2,SPO2,"+str(SPO2))
					if ser.in_waiting > 0:
						line = ser.readline().decode('utf-8').rstrip()
						
						if(line[0:4] == "ldr1"):
							print("first " + str(line))
							ldr1 = int(line[4:])
                			
						if(line[0:4] == "ldr2"):
							print("second " + str(line))
							ldr2 = int(line[4:])
                            
							if (ldr1<500 and ldr2>500):
								publish("s/us", "200,c8y_LDR1,LDR_LOW," + str(0))
								publish("s/us", "301,criticalAlarmType[,Child breakthrough")
								
								GPIO.output(14, GPIO.HIGH)
								time.sleep(3)
								GPIO.output(14, GPIO.LOW)
								
							else:
								publish("s/us", "200,c8y_LDR1,LDR_LOW," + str(1)) 
								
							if (ldr1 < 500 and ldr2 < 350):
								publish("s/us", "200,c8y_LDR1,LDR_LOW," + str(0))
								publish("s/us", "200,c8y_LDR2,LDR_HIGH," + str(0))
								if (swim == 1):
									swim = 0
								else:
									swim = 1
									
							else:
								publish("s/us", "200,c8y_LDR2,LDR_HIGH," + str(1))   								
								                 			
						if(line[0:4] == "ldr3"):
							print("third " + str(line))
							ldr3 = int(line[4:])
							
						if(line[0:4] == "ldr4"):
							print("fourth " + str(line))
							ldr4 = int(line[4:])
							
							if(ldr3 < 500 and ldr4 > 500):
								publish("s/us", "200,c8y_LDR3,LDR_LOW," + str(0))
								publish("s/us", "301,criticalAlarmType[,Child breakthrough]")
								
								GPIO.output(14, GPIO.HIGH)
								time.sleep(3)
								GPIO.output(14, GPIO.LOW)
								
							else:
								publish("s/us", "200,c8y_LDR3,LDR_LOW," + str(1)) 
								
							if (ldr3 < 500 and ldr4 < 350):
								publish("s/us", "200,c8y_LDR3,LDR_HIGH," + str(0))
								publish("s/us", "200,c8y_LDR4,LDR_LOW," + str(0))
								
								if (swim == 1):
									swim = 0
								else:
									swim = 1
									
							else:
								publish("s/us", "200,c8y_LDR4,LDR_HIGH," + str(1))   								
				
								
                			
						if(line[0:4] == "ldr5"):
							print("fifth " + str(line))
							ldr5 = int(line[4:])
							
						if(line[0:4] == "ldr6"):
							print("sixth " + str(line))
							ldr6 = int(line[4:])
							
							if(ldr5 <500 and ldr6>400):
								publish("s/us", "200,c8y_LDR5,LDR_LOW," + str(0))
								publish("s/us", "301,criticalAlarmType[,Child breakthrough]")
								
								GPIO.output(14, GPIO.HIGH)
								time.sleep(1)
								GPIO.output(14, GPIO.LOW)
								
							else:
								publish("s/us", "200,c8y_LDR5,LDR_LOW," + str(1)) 
								
							if (ldr5 < 500 and ldr6 < 350):
								publish("s/us", "200,c8y_LDR5,LDR_HIGH," + str(0))
								publish("s/us", "200,c8y_LDR6,LDR_LOW," + str(0))
								
								if (swim == 1):
									swim = 0
								else:
									swim = 1
									
							else:
								publish("s/us", "200,c8y_LDR6,LDR_HIGH," + str(1))   								
                			
						if(line[0:4] == "ldr7"):
							print("seventh " + str(line))
							ldr7 = int(line[4:])
							
						if(line[0:4] == "ldr8"):
							print("eighth " + str(line))
							ldr8 = int(line[4:])
							
							if(ldr7 <500 and ldr8>500):
								publish("s/us", "200,c8y_LDR7,LDR_LOW," + str(0))
								publish("s/us", "301,criticalAlarmType[,Child breakthrough]")
								
								GPIO.output(14, GPIO.HIGH)
								time.sleep(3)
								GPIO.output(14, GPIO.LOW)
								
							else:
								publish("s/us", "200,c8y_LDR7,LDR_LOW," + str(1)) 
								
							if (ldr7 < 500 and ldr8 < 350):
								publish("s/us", "200,c8y_LDR7,LDR_HIGH," + str(0))
								publish("s/us", "200,c8y_LDR8,LDR_LOW," + str(0))
								
								if (swim == 1):
									swim = 0
								else:
									swim = 1
									
							else:
								publish("s/us", "200,c8y_LDR8,LDR_HIGH," + str(1))   								
								
						if(line[0:4] == "Temp"):
							#print("Temp"+str(line[4:0]))
							temp= random.randint(10, 20)
							print(temp)
							publish("s/us", "200,c8y_Temp,WaterTemp,"+str(temp))
							

							
						if(line[0:3] == "TDS"):
							print("Water Quality"+str(line[3:0]))
							TDS= float(line[3:])
							print(TDS)
							publish("s/us", "200,c8y_TDS,WaterQuality,"+str(TDS))
							payload = ('{\n\"TDS\":' + str(TDS) +' \n}')
							headers = {'Content-Type': 'text/plain'}
							response = requests.request("PUT", url, headers=headers, data=payload)
							if(TDS < 500 or TDS > 2500):
								publish("s/us", "302,majorAlarmType[,Poor water quality")
								
						if(line[0:2] == "pH"):
							print("Water Quality"+str(line[2:0]))
							pH= float(line[2:])
							print(pH)
							publish("s/us", "200,c8y_pH,pHLevel,"+str(pH))
							
							if(pH < 7.2):
								publish("s/us", "302,majorAlarmType[,Low pH level")
								
							if(pH > 7.8):
								publish("s/us", "302,majorAlarmType[,High pH level")
								
						
				

                      
# publish a message
def publish(topic, message, waitForAck = False):
    mid = client.publish(topic, message, 2)[1]
    if (waitForAck):
        while mid not in receivedMessages:
            time.sleep(0.25)
            
def on_publish(client, userdata, mid):
    receivedMessages.append(mid)

# connect the client to Cumulocity IoT and register a device
client = mqtt.Client(clientId)
client.username_pw_set(tenant + "/" + username, password)
client.on_message = on_message
client.on_publish = on_publish

client.connect(serverUrl)
client.loop_start()
publish("s/us", "100," + device_name + ",c8y_MQTTDevice", True)
publish("s/us", "110,S123456789,MQTT test model,Rev0.1")
publish("s/us", "114,c8y_Restart")
publish("s/us", "114,c8y_Command")

print("Device registered successfully!")

client.subscribe("s/ds")
#while True:
sendMeasurements()

