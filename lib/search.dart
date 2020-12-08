import 'dart:html';

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Flutter App'), actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("Check Points"),
        )
      ]),
      body: Container(
        searchbar : SearchBar('press here');
      )
    );
  }
}
