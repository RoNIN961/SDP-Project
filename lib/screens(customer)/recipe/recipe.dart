import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Container(
              child: SizedBox(
                child: Text(
                  "Recipes",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: RecipePageListView())
      ],
    );
  }
}

class RecipePageListView extends StatefulWidget {
  @override
  _RecipePageListViewState createState() => _RecipePageListViewState();
}

class _RecipePageListViewState extends State<RecipePageListView> {
  List data;

  Future<String> getJSONData() async {
    var response = await http.get(
      // Encode the url
      Uri.encodeFull(
          "https://czechoslovakian-scr.000webhostapp.com/recipe_info.php"),
      // Only accept JSON response
      headers: {"Accept": "application/json"},
    );

    setState(() {
      // Get the JSON data
      print(response.body);
      data = jsonDecode(response.body);
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        shrinkWrap: true,
        padding:
            const EdgeInsets.only(top: 15.00, bottom: 15.00, left: 8, right: 4),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: _buildRecipeCard(data[index]),
          );
          // return _buildRow(data[index]);
        });
  }

  Widget _buildRecipeCard(dynamic item) => Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: 100.0, maxHeight: 100.0),
                  child: CachedNetworkImage(
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://czechoslovakian-scr.000webhostapp.com/uploads(Recipe)/${item['Directory']}',
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    fadeOutDuration: new Duration(seconds: 1),
                    fadeInDuration: new Duration(seconds: 3),
                  ),
                ),
                title: Text(
                  item['Recipe_Title'] == null ? '' : item['Recipe_Title'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                contentPadding: null,
                subtitle: Text(
                  item['Username'] == null ? '' : item['Username'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('View'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/recipe_detail');
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}
