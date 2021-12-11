import "package:flutter/material.dart";
import "package:project/utils/colors.dart";
import 'package:project/utils/dimensions.dart';
import 'package:project/utils/styles.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home Page",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: "Trends",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
          ),
        ],

    );
  }
}
