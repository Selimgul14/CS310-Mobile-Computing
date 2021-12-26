import 'package:flutter/material.dart';
import 'package:project/services/search_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: /*const*/ MyHomePage(/*title: 'Search For News'*/),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget title = Text("Search Page");
  IconData myIcon = Icons.search;

  /*
  void _searchViewChange(){
    setState(() {
      if (this.myIcon == Icons.search){
        title = new TextField(
          style: new TextStyle(
            color: Colors.white,
          ),
          decoration: new InputDecoration(
            hintText: "search news",
          ),
        );
        this.myIcon = Icons.close;
      }
      else{
        this.myIcon = Icons.search;
        title = Text("Search Page");
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              myIcon,
              color: Colors.white,
            ),
            onPressed: () {
              //_searchViewChange();
              showSearch(context: context, delegate: SearchClass());
            },
          )
        ],
      ),
    );
  }
}
