import "package:flutter/material.dart";
import "package:project/utils/colors.dart";
import 'package:project/utils/dimensions.dart';
import 'package:project/utils/styles.dart';
import 'login.dart';

class bottomNavigationBar extends StatelessWidget {
  Function onTabChange;
  var _currentIndex = 0;
  bottomNavigationBar(this._currentIndex, {required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
        onTap: onTabTapped,
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
  var lastIndex;

  void onTabTapped(int index){
    _currentIndex = index;
    onTabChange(index);
  }

}
