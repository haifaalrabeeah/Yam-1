import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yam/Home%20Page/HomePage.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => InputFieldstate();
}

class InputFieldstate extends State<InputField>{

  @override
final _formKey = GlobalKey<FormState>();

  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String myUsername = '';
  String myUseremail = '';

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey)
                )
            ),
            child:TextFormField(
              controller: _emailContoller,

              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey)
                )
            ),
            child:TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.vpn_key),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),

          SizedBox(height: 40,),
          Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color:Color(0xFF88B0D7),
              borderRadius: BorderRadius.circular(30),
            ),
            child:Center(
              child:FlatButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar.

                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailContoller.text,
                          password: _passwordController.text
                      );

                      if(userCredential.user != null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logged in Successfully')),
                        );
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );

                      };


                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No user found for that email')),

                        );
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wrong password provided for that user')),

                        );
                      }
                    }
                  }
                },
                child: const Text('Login',style:
                TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}