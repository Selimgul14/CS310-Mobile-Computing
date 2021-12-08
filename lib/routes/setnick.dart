import 'package:project/routes/drawer.dart';
import 'package:project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/styles.dart';

class SetNick extends StatefulWidget {
  const SetNick({Key? key}) : super(key: key);

  @override
  _SetNickState createState() => _SetNickState();
}

class _SetNickState extends State<SetNick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Set Nickname",
          style: AppBarTitleTextStyle,
        ),
        backgroundColor: AppColors.buttonColor1,
        centerTitle: true,
        elevation: 0.0,
      ),

    );
  }
}