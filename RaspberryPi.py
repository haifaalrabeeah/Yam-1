#!/usr/bin/env python3
#!/usr/bin/env python3
import paho.mqtt.client as mqtt
import time, random
from gpiozero import LightSensor,Buzzer
from time import sleep
import RPi.GPIO as GPIO
import serial
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


# display all incoming messages
def on_message(client, userdata, message):
    print("Received operation " + str(message.payload))
    if (message.payload.startswith("510")):
        print("Simulating device restart...")
        publish("s/us", "501,c8y_Restart");
        print("...restarting...")
        time.sleep(1)
        publish("s/us", "503,c8y_Restart");
        print("...done...")

# send measurement
def sendMeasurements():
	if __name__ == '__main__':
			ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)
			ser.flush()
					
			while True:
					print("Sending LDR measurement...")
					url = "https://yam-project-2021-default-rtdb.firebaseio.com/HeartRate/HR.json"
					payload = ""
					headers = {}
					response = requests.request("GET", url, headers=headers, data=payload)
					print(response.text)
					publish("s/us", "200,c8y_heartRate,HR,"+str(response.text))
					GPIO.output(14, GPIO.LOW)
					sleep(0.1)
					if ser.in_waiting > 0:
						line = ser.readline().decode('utf-8').rstrip()
						if(line[0:4] == "ldr1"):
							print("first " + str(line))
							ldr1 = int(line[4:])
                			
						if(line[0:4] == "ldr2"):
							print("second " + str(line))
							ldr2 = int(line[4:])
                            
							if (ldr1<350 and ldr2>500):
								publish("s/us", "200,c8y_LDR,LDR," + str(0))
								publish("s/us", "301,criticalAlarmType[,breakthrough]")
								GPIO.output(14, GPIO.HIGH)
								time.sleep(5)
								GPIO.output(14, GPIO.LOW)
							if (ldr1 < 350 and ldr2 < 350 and response.text < "50"):
								publish("s/us", "200,c8y_LDR,LDR," + str(0))
								publish("s/us", "301,criticalAlarmType[,breakthrough]")
							else:
								publish("s/us", "200,c8y_LDR,LDR," + str(1))   
								                 			
						if(line[0:4] == "ldr3"):
							print("third " + str(line))
							ldr3 = int(line[4:])
						if(line[0:4] == "ldr4"):
							print("fourth " + str(line))
							ldr4 = int(line[4:])
							if(ldr3 < 350 and ldr4 > 500):
								publish("s/us", "200,c8y_LDR,LDR," + str(0))
								publish("s/us", "301,criticalAlarmType[,breakthrough]")
								GPIO.output(14, GPIO.HIGH)
								time.sleep(5)
								GPIO.output(14, GPIO.LOW)

							if (ldr3 < 350 and ldr4 < 350 and response.text < "50"):
								publish("s/us", "200,c8y_LDR,LDR," + str(0))
								publish("s/us", "301,criticalAlarmType[,breakthrough]")
							else:
								publish("s/us", "200,c8y_LDR,LDR," + str(1))
				
								
                			
						if(line[0:4] == "ldr5"):
							print("fifth " + str(line))
							ldr5 = int(line[4:])
						if(line[0:4] == "ldr6"):
							print("sixth " + str(line))
							ldr6 = int(line[4:])
							if(ldr5 <350 and ldr6>500):
								publish("s/us", "200,c8y_LDR,LDR," + str(0))
								publish("s/us", "301,criticalAlarmType[,breakthrough]")
								GPIO.output(14, GPIO.HIGH)
								time.sleep(5)
								GPIO.output(14, GPIO.LOW)
							if (ldr5 < 350 and ldr6 < 350 and response.text < "50"):
								publish("s/us", "200,c8y_LDR,LDR," + str(0))
								publish("s/us", "301,criticalAlarmType[,breakthrough]")
							else:
								publish("s/us", "200,c8y_LDR,LDR," + str(1))   								
                			
						if(line[0:4] == "ldr7"):
							print("seventh " + str(line))
							ldr7 = int(line[4:])
						if(line[0:4] == "ldr8"):
							print("eighth " + str(line))
							ldr8 = int(line[4:])
							if(ldr7 <350 and ldr8>500):
								publish("s/us", "200,c8y_LDR,LDR," + str(0))
								publish("s/us", "301,criticalAlarmType[,breakthrough]")
								GPIO.output(14, GPIO.HIGH)
								time.sleep(5)
								GPIO.output(14, GPIO.LOW)

							if (ldr7 < 350 and ldr8 < 350 and response.text < "50"):
								publish("s/us", "200,c8y_LDR,LDR," + str(0))
								publish("s/us", "303,minorAlarmType[,breakthrough]")
							else:
								publish("s/us", "200,c8y_LDR,LDR," + str(1))
								
						if(line[0:4] == "Temp"):
							print("Temp"+str(line[4:0]))
							temp= float(line[4:])
							print(temp)
							publish("s/us", "200,c8y_Temp,WaterTemp,"+str(temp))
							
						if(line[0:3] == "TDS"):
							print("Water Quality"+str(line[3:0]))
							TDS= float(line[3:])
							print(TDS)
							publish("s/us", "200,c8y_TDS,WaterQuality,"+str(TDS))
							
						if(line[0:2] == "pH"):
							print("Water Quality"+str(line[2:0]))
							pH= float(line[2:])
							print(pH)
							publish("s/us", "200,c8y_pH,pHLevel,"+str(pH))
							
							
							


              
           
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
print("Device registered successfully!")

client.subscribe("s/ds")
#while True:
sendMeasurements()

