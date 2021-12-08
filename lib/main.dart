import 'package:flutter/material.dart';
import 'package:project/routes/login.dart';
import 'package:project/routes/signup.dart';
import 'package:project/routes/welcomepage.dart';
import 'package:project/routes/setnick.dart';
import 'package:project/routes/onboarding_page.dart';

void main(){
  runApp(MaterialApp(
    home: WelcomeScreen(),
    initialRoute: "/walkthrough",
    routes: {
      "/walkthrough": (context) => OnboardingPage(),
      "/login": (context) => Login(),
      "/signup": (context) => SignUp(),
      "/setnick": (context) => SetNick(),
      "/welcome": (context) => WelcomeScreen(),
    },
    debugShowCheckedModeBanner: false,




  ));
}