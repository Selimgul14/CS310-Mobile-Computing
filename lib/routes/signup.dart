import 'package:firebase_analytics/observer.dart';
import 'package:project/routes/drawer.dart';
import 'package:project/services/analytics.dart';
import 'package:project/services/auth.dart';
import 'package:project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/styles.dart';
import 'package:project/utils/dimensions.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project/services/auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:project/routes/bottomNavigation.dart';


class SignUp extends StatefulWidget {
  SignUp({Key, key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _SignUpState createState() => _SignUpState();
}



class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  String _message = '';
  int attemptCount = 0;
  String mail = '';
  String pass = '';
  final _formKey = GlobalKey<FormState>();

  AuthService auth = AuthService();

  void setmessage(String msg){
    setState(() {
      _message = msg;
    });
  }



  @override
  Widget build(BuildContext context) {
    setCurrentScreen(widget.analytics, "/signup", "signup.dart");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: AppBarTitleTextStyle,
        ),
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Sign Up',
                  style: HeaderTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    color: AppColors.buttonColor1,
                    child: Text(
                      'Sign Up',
                      style: ButtonTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    AuthService service = new AuthService();
                    try {
                      await service.signInwithGoogle();
                      Navigator.pushNamedAndRemoveUntil(context, "welcome", (route) => false);
                    } catch(e){
                      if(e is FirebaseAuthException){
                        print(e.message!);
                      }
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  elevation: 0.0,
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  color: Colors.black,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '''Already have an account? ''',
                      style: SubTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Text('Log in now'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}