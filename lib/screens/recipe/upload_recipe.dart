import 'package:flutter/material.dart';

class UploadRecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
      children: [
        SizedBox(
            width: 400.0,
            height: 80.0,
            child: InkWell(
              child: Text('Upload Recipe Image'),
              onTap: () {},
            )),
        TextField(
          decoration: InputDecoration(hintText: 'Title:Ginger Chicken'),
        ),
        Container(
            child: Column(
          children: <Widget>[
            Title(color: Colors.black, child: Text('Ingredients')),
            TextField(decoration: InputDecoration(hintText: '250g flour')),
            TextField(decoration: InputDecoration(hintText: '100ml water')),
            RaisedButton(child: Text('Add Ingredient'), onPressed: null)
          ],
        ))
      ],
    )));
  }
}
