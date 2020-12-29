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
              child: Text('Upload Recipe Image',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              onTap: () {},
            )),
        TextField(
          decoration: InputDecoration(hintText: 'Title:Ginger Chicken'),
        ),
        Container(
            child: Column(
          children: <Widget>[
            Title(
                color: Colors.black,
                child: Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                )),
            TextField(decoration: InputDecoration(hintText: '250g flour')),
            TextField(decoration: InputDecoration(hintText: '100ml water')),
            RaisedButton(child: Text('Add Ingredient'), onPressed: null)
          ],
        )),
        Container(
            child: Column(
          children: <Widget>[
            Title(
                color: Colors.black,
                child: Text(
                  'Steps',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                )),
            TextField(decoration: InputDecoration(hintText: 'Step 1')),
            TextField(decoration: InputDecoration(hintText: 'Step 2')),
            RaisedButton(child: Text('Add Steps'), onPressed: null)
          ],
        )),
        RaisedButton(
          onPressed: null,
          child: Text('Upload Recipe'),
        )
      ],
    )));
  }
}
