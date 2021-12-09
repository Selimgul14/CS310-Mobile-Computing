import 'package:flutter/material.dart';
import 'package:project/routes/login.dart';
import 'package:project/routes/signup.dart';
import 'package:project/routes/welcomepage.dart';
import 'package:project/routes/setnick.dart';
import 'package:project/routes/onboarding_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


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