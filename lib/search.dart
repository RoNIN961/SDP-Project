import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage>{
  final duplicateItems = List<String>.generate(20, (i) => "Item $i");
  var items = List<String>();
  Widget build(BuildContext context) {
    return Scaffold(
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
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context,index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  )
                },
              ),
            ),
      ],
    )));
  }
}
