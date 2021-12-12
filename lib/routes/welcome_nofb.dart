import 'package:flutter/material.dart';
import 'package:project/services/analytics.dart';
import 'package:project/utils/colors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/services/analytics.dart';



class WelcomeViewNoFB extends StatelessWidget {
  late final FirebaseAnalytics analytics;
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics().setCurrentScreen(screenName: "/welcomeNoFB", screenClassOverride: "welcome_nofb.dart");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Firebase Failed",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppColors.appBarColor,
          ),
        ),
      ),
    );
  }
}
