import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
import 'package:project/services/auth.dart';
import 'package:project/routes/welcome_nofb.dart';
import 'package:shared_preferences/shared_preferences.dart';


int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (await prefs.getInt("initScreen"));
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          print("Cannot connect to firebase: " + snapshot.error.toString());
          return MaterialApp(
            home: WelcomeViewNoFB(),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          print("Firebase connected");
          return AppBase();
        }
        return MaterialApp(
          home: WelcomeScreen(observer: observer, analytics: analytics),
        );
      }
    );
  }
}

class AppBase extends StatelessWidget {

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        navigatorObservers: <NavigatorObserver>[observer],
        home: WelcomeScreen(observer: observer, analytics: analytics),
        //initialRoute: initScreen == 0 || initScreen == null ? "/walkthrough" : "Welcome",
        routes: {
          "/walkthrough": (context) => OnboardingPage(),
          "/login": (context) => Login(observer: observer, analytics: analytics),
          "/signup": (context) => SignUp(observer: observer, analytics: analytics),
          "/welcome": (context) => WelcomeScreen(observer: observer, analytics: analytics),
          "/welcomeNoFB": (context) => WelcomeViewNoFB(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}




