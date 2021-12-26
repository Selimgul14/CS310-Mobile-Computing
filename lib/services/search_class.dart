import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchClass extends SearchDelegate<String> {
  List<String> data = [
    "As Omicron Cases Soar, the Unvaccinated Remain Defiant",
    "Sardi’s Is Back After 648 Days, Its Fortunes Tied to Broadway",
    "As Prices Rise, Biden Turns to Antitrust Enforcers",
    "How Do Saudis Celebrate Christmas? Quietly, but Less So.",
    "After Hurricanes and Pandemic, a New Orleans Museum Fights to Hold On",
  ];

  @override
  List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context){
    List<String> searchedNews = [];
    for(var i in data){
      if (i.contains(query)){
        searchedNews.add(i);
      }
    }
    return ListView.builder(
      itemCount: searchedNews.length,
      itemBuilder: (context,index){

        return ListTile(
          title: Text(searchedNews[index]),
        );
      },
    );
  }
}
