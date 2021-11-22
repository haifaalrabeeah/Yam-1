/*--------------------------------*/
/* importing all libraries needed */
/*--------------------------------*/

import * as messaging from "messaging";

import { peerSocket } from "messaging";

 import { me } from "companion";

/*--------------------------------*/
   /* checking internet access */
/*--------------------------------*/
console.log("Application ID: " + me.applicationId);
if (!me.permissions.granted("access_internet")) {
   console.log("We're not allowed to access the internet :-(");
}

/*--------------------------------*/
        /* peer socket */
/*--------------------------------*/

messaging.peerSocket.addEventListener("open", (evt) => {});
messaging.peerSocket.addEventListener("message", (evt) => {

    fetch('https://yam-project-2021-default-rtdb.firebaseio.com/HeartRate.json', {

            method: 'PUT',

            headers: {

                'Content-Type': 'application/json'

            },

            body: JSON.stringify({
              "HR":evt.data
            })

        })

        .then(response => {

            /*console.log(response);*/})

        .catch(error => {

            /*console.log(error);*/ });

});