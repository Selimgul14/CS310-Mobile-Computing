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

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
      ),
      body: _postListView(),
    );
  }

  Widget _postAuthorRow(){
    const double avatarDiameter = 44;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: avatarDiameter,
            height: avatarDiameter,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(avatarDiameter),
              child: Image.network(
                "https://d1lss44hh2trtw.cloudfront.net/assets/article/2021/02/02/google-stock-rises-as-earnings-report-drops_feature.jpg"
              ),
            ),
          ),
        ),
        Text("Username", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _postView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow()
      ],
    );
  }

  Widget _postListView(){
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index){
        return _postView();
    });
  }
}
