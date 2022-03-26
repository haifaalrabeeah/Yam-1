import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yam/Login/LoginPage.dart';


class InputField2 extends StatefulWidget {
  const InputField2({Key? key}) : super(key: key);

  @override
  State<InputField2> createState() => InputField2state();
}

class InputField2state extends State<InputField2>{
  @override

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ConfirmpasswordController = TextEditingController();



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
                    bottom: BorderSide(color: Colors.white)
                )
            ),
            child:TextFormField(
              decoration: InputDecoration(
                  hintText: "Full Name",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.person),
              ),
              controller: _nameController,
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
                    bottom: BorderSide(color: Colors.white)
                )
            ),
            child:TextFormField(
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email)
              ),
              controller: _emailContoller,

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
                    bottom: BorderSide(color: Colors.white)
                )
            ),
            child:TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.vpn_key),
              ),
              controller: _passwordController,
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
                    bottom: BorderSide(color: Colors.white)
                )
            ),
            child:TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Confrim Password",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.vpn_key),
              ),
              controller: _ConfirmpasswordController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty || _ConfirmpasswordController.text != _passwordController.text) {
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
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailContoller.text,
                          password: _passwordController.text
                      );

                      if (userCredential != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registered Successfully')),
                        );
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()),
                        );
                        User? user = userCredential.user;
                        await FirebaseFirestore.instance.collection('Supervisor')
                            .doc(user!.uid).set({ 'Name':_nameController.text,'Email':_emailContoller.text});

                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('The password provided is too weak')),
                        );
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('An account already exists for that email')),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  }

                },
                child: const Text('Sign Up',style:
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