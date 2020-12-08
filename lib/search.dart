import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
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
            ))
      ],
    )));
  }
}
