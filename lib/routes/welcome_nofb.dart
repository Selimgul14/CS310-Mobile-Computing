import 'package:flutter/material.dart';
import 'package:project/utils/colors.dart';


class WelcomeViewNoFB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
