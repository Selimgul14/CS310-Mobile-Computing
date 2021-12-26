import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/services/user.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:project/widgets/appbar_widget.dart';
import 'package:project/widgets/button_widget.dart';
import 'package:project/widgets/numbers_widget.dart';
import 'package:project/widgets/profile_widget.dart';
import 'package:project/utils/styles.dart';
import 'package:project/services/analytics.dart';
import 'package:firebase_analytics/observer.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
  const ProfilePage({Key, key, required this.analytics, required this.observer}) : super(key: key);
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserInstance.myUser;
    setCurrentScreen(widget.analytics, 'Profile Page', 'profile_page.dart');

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              Navigator.pushNamed(context, "/edit_profile");
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(

        children: [
          Text(
            user.name,
            style: HeaderTextStyle,
          ),
          const SizedBox(height: 4),
          Text(
            user.username,
            style: SubTextStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            user.location,
            style: SubTextStyle,
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Become a Content Creator',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: HeaderTextStyle,
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: SubTextStyle,
            ),
          ],
        ),
      );
}
