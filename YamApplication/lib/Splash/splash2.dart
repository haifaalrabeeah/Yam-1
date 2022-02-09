import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:yam/Login/LoginPage.dart';
import 'package:yam/Sign%20Up/SignUpPage.dart';

void main() {
  runApp(splash());
}
    class splash extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    /// Normal Logo Splash screen
    Widget example1 = SplashScreenView(
    navigateRoute: LoginPage(),
    duration: 5000,
    imageSize: 200,
    imageSrc: "yamLogo2.png",
    backgroundColor: Color(0xFF2C4E74),
      //backgroundColor: Colors.white,


    );

    return MaterialApp(
      title: 'Splash screen Demo',
        debugShowCheckedModeBanner: false,
        home: example1,
    );
    }
    }