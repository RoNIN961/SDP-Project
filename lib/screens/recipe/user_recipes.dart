import 'package:flutter/material.dart';

class UserRecipePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserRecipePageState();
  }
}

class _UserRecipePageState extends State<UserRecipePage> {
  final duplicateItems = List<String>.generate(20, (recipe) => "Item $recipe");
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Flutter App'), actions: <Widget>[]),
        body: Container(
            child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {},
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ),
            ),
          ],
        )));
  }
}
