import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class WaterCompanyListContent extends StatefulWidget {
  @override
  _WaterCompanyListContentState createState() => _WaterCompanyListContentState();
}

class _WaterCompanyListContentState extends State<WaterCompanyListContent> {
  User? user = FirebaseAuth.instance.currentUser;
  String company = "";
  var phone = "";
  String email = "";


  // Title List Here
  var titleList = [
    "Yam",
    "Bin Taleb " ,
    "Matn Pools",
    "Albarrak Pools "

  ];

  // Description List Here
  var descList = [
    "Email: yam@gmail.com \n Phone Number: 0500000005",
    "Email: bintaleb@bintaleb.com \n Phone Number: 920013334",
    "Email: info@pool.sa \n Phone Number: 0552200020 " ,
    "Email: bintaleb@bintaleb.com \n Phone Number: 920013334 "
  ];

  // Image Name List Here
  var imgList = [
    "assets/yamLogo2.png",
    "assets/yamLogo2.png",
    "assets/yamLogo2.png",
    "assets/yamLogo2.png"
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('Contacts').doc('1').snapshots().listen((event) {
      setState(() {
        company = event.get('Company');
        email = event.get('Email');
        phone = event.get('Phone');
      });
    });
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 5.0,
            ),
      child:ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(context, imgList[index], titleList[index], descList[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child:SizedBox(
            width: double.infinity,
            child: Card(

              child: Row(
                children: <Widget>[

              Expanded(
              child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF2C4E74),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
                ],
              ),
            ),
            ),
          );
        },
      ),
    ),
    ),
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
