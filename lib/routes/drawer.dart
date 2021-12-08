import "package:flutter/material.dart";
import "package:project/utils/colors.dart";
import 'package:project/utils/dimensions.dart';
import 'package:project/utils/styles.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: Dimen.zeroPadding,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              shape: BoxShape.rectangle,
            ),
            child: Text(
                "News Application",
            ),
          ),
          ListTile(
            title: const Text("Login"),
            onTap: (){
              Navigator.pushNamed(context, '/login');
            },
            tileColor: AppColors.secondaryColor,
          ),
          ListTile(
            title: const Text("Sign Up"),
            onTap: (){
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ],
      ),
    );
  }
}