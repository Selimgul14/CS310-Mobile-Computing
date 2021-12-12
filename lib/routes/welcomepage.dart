import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/styles.dart';
import 'package:project/utils/themebutton.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:project/services/analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key, key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _message = '';
  void setMessage(String msg) {
    setState(() {
      _message = msg;
    });
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    FirebaseAnalytics().setCurrentScreen(screenName: "/welcome", screenClassOverride: "welcomepage.dart");
    return Scaffold(

      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: Image.network(
                    'https://www.sabanciuniv.edu/sites/default/files/zoom-bg/university-center.png',
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Image.network(
                            'https://www.sabanciuniv.edu/sites/default/files/sabanci_universitesi_logo_rgb.jpg',
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('CS310 News Application',
                    textAlign: TextAlign.center,
                    style: welcomePageTextStyle,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: ButtonTextStyle,
                  ),
                  SizedBox(height: 60),
                  ThemeButton(
                    label: 'Sign up',
                    highlight: Colors.blueGrey,
                    color: Colors.white,
                    onClick: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                  ),
                  ThemeButton(
                    label: 'Login',
                    labelColor: Colors.white,
                    borderColor: Colors.white,
                    borderWidth: 4,
                    highlight: Colors.blueGrey,
                    color: Colors.transparent,
                    onClick: () {
                      Navigator.pushNamed(context, "/login");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}