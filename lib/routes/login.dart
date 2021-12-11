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
import 'package:firebase_analytics/observer.dart';

class Login extends StatefulWidget {
  Login({Key, key, required this.analytics, required this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    setCurrentScreen(widget.analytics, "/login", "login.dart");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log in",
          style: AppBarTitleTextStyle,
        ),
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: bottomNavigationBar(),
      body: Padding(
        padding: Dimen.regularPadding,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Log In',
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
                  validator: (value)
                  {
                    if (value != null){
                      if(value.isEmpty){
                        return "Please enter your e-mail";
                      }
                      if(!EmailValidator.validate(value)){
                        return "The e-mail address is not valid";
                      }
                    }
                    else {
                      return "Please enter your e-mail";
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    if(value != null){
                      mail = value;
                    }
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),

                  validator: (value) {
                    if(value != null){
                      if (value.isEmpty) {
                        return "Please enter your password";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                    }
                    else {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    pass = value ?? '';
                  }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Forgotted Password!');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
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
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        print("Email: $mail");
                        print("Password: $pass");
                        _formKey.currentState!.save();
                        auth.loginWithMailAndPass(mail, pass);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logging in")));
                      }
                    },
                    color: AppColors.buttonColor1,
                    child: Text(
                      'Log In',
                      style: ButtonTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Log in with Google",
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googleLogin();
                  },
                  elevation: 0.0,
                ),
                SizedBox(
                  height: 15,
                ),
                SignInButton(
                  Buttons.Facebook,
                  text: "Log in with Facebook",
                  onPressed: () {},
                  elevation: 0.0,
                ),
                Divider(
                  color: Colors.black,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '''Don't you have an account? ''',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: Text('Sign up now'),
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