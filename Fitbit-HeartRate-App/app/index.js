
/*--------------------------------*/
/* importing all libraries needed */
/*--------------------------------*/

import document from "document";

import HeartRateSensor from "heart-rate";

import * as messaging from "messaging";

import me from "appbit";

import { peerSocket } from "messaging";

const label = document.getElementById("bpm");

import { BodyPresenceSensor } from "body-presence";



/*-----------------------------*/
/* attempt to keep app alive */
/*-----------------------------*/

me.appTimeoutEnabled = false;

/*-----------------------------*/
      /* peer socket */
/*-----------------------------*/

messaging.peerSocket.addEventListener("open", (evt) => {});

/*-------------------------------------------------------*/
/* reading Heart rate data and sending it through socket */
/*-------------------------------------------------------*/

const hrm = new HeartRateSensor({

    frequency: 1

});


if(BodyPresenceSensor){

hrm.addEventListener("reading", () => {

    var hr = hrm.heartRate ? hrm.heartRate : 0;


    label.text = hr;

  
    if (messaging.peerSocket.readyState === messaging.peerSocket.OPEN) {

        messaging.peerSocket.send(hr);    }
  
  else {
	    console.log("sendMessage() - ERROR peerSocket not ready - not sending message");
  }

});
}


hrm.start();