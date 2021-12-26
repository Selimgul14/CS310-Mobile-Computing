import 'package:flutter/material.dart';

class CategorySeach extends SearchDelegate<String>{
  final Categories = [
    "Sports",
    "Politics",
    "World",
    "Europe",
    "Finance",
  ];
  final recentCategories = [
    "Sports",
    "Politics",
  ];
  String nul = "";
  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){
          query = "";
          showSuggestions(context);
        },
    )
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: (){
      close(context, nul);
    },
  );

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.article, size: 120),
        const SizedBox(height: 48),
        Text(
          query,
          style: TextStyle(
            color: Colors.black,
            fontSize: 64,
            fontWeight: FontWeight.bold,
          )
        )
      ],
    )
  );


  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? recentCategories : Categories.where((category){
      final categoryLower = category.toLowerCase();
      final queryLower = query.toLowerCase();
      return categoryLower.startsWith(queryLower);
    }).toList();

    return buildSuggestionsSuccess(suggestions);
  }
  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
    itemCount: suggestions.length,
    itemBuilder: (context, index){
      final suggestion = suggestions[index];

      return ListTile(
        onTap: (){
          query = suggestion;

          showResults(context);
        },
        leading: Icon(Icons.article),
        title: Text(suggestion),
      );
    },
  );

}