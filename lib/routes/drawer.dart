import "package:flutter/material.dart";
import 'package:project/routes/feed.dart';
import 'package:project/routes/profile_page.dart';
import "package:project/utils/colors.dart";
import 'package:project/utils/dimensions.dart';
import 'package:project/utils/styles.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';

class MyDrawer extends StatelessWidget {
  late final FirebaseAnalytics analytics;
  late final FirebaseAnalyticsObserver observer;

  final padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Material(
        color: AppColors.appBarColor,
        child: ListView(
          padding: padding,
          children: <Widget>[

            const SizedBox(height: 16),
            buildMenuItem(
              text: "World",
              icon: Icons.public,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: "Science",
              icon: Icons.science,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: "Technology",
              icon: Icons.smartphone,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: "Sports",
              icon: Icons.sports,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white70),
            const SizedBox(height: 24),
            buildMenuItem(
              text: "Home",
              icon: Icons.home,
              onClicked: ( )=> selectedItem(context, 4),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: "Profile",
              icon: Icons.account_circle,
              onClicked: () {
                Navigator.pushNamed(context, "/profile_page");
              },
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: "Sign Out",
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 6),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: drawerTextStyle),
      onTap: onClicked,
    );
  }
  void selectedItem(BuildContext context, int index){
    switch(index){
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FeedView(),

        ));
    }
  }

}