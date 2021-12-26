import 'package:flutter/material.dart';
import 'package:project/routes/bottomNavigation.dart';
import 'package:project/routes/drawer.dart';
import 'package:project/utils/colors.dart';
import 'package:project/utils/styles.dart';
import 'package:project/widgets/post_card.dart';
import 'package:project/services/search_service.dart';


class FeedView extends StatefulWidget {

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  int _currentIndex = 0;
  var lastIndex;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = Text("Feed", style: AppBarTitleTextStyle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        backgroundColor: AppColors.appBarColor,
        actions: [
          IconButton(
          icon: Icon(Icons.search),
            onPressed: (){
              final results = showSearch(context: context, delegate: CategorySeach());
            },

            ),
        ],
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: bottomNavigationBar(_currentIndex, onTabChange: (index){
        _currentIndex = index;
        setState(() {
          if(_currentIndex == 3 && _currentIndex == lastIndex){}
          lastIndex = index;
          if(_currentIndex == 0){
            Navigator.pushNamed(context, "/feed");
          }
          if(_currentIndex == 2){
            Navigator.pushNamed(context, "/profile_page");
          }
        });
      },),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return PostCard();
          }
      ),
    );
  }
}

