import 'package:project/routes/drawer.dart';
import 'package:project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/styles.dart';
import 'package:project/utils/dimensions.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => print("Signed up successfully."),
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
                  onPressed: () {},
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