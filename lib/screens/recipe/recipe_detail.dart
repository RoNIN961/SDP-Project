import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            title: Text('My Flutter App'),
            actions: <Widget>[]),
        body: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Title(color: Colors.black, child: Text('Title')),
              SizedBox(
                width: 500.0,
                height: 200.0,
                child: Image(image: null),
              ),
              SizedBox(
                width: 400.0,
                height: 200.0,
                child: ListView(
                  children: <Widget>[
                    Title(color: Colors.black, child: Text('Ingredients')),
                    ListTile(
                      title: Text('Ingredient 1'),
                    ),
                    ListTile(
                      title: Text('Ingredient 2'),
                    ),
                    ListTile(
                      title: Text('Ingredient 3'),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 400.0,
                height: 200.0,
                child: ListView(
                  children: <Widget>[
                    Title(color: Colors.black, child: Text('Steps')),
                    ListTile(
                      title: Text('Step 1'),
                    ),
                    ListTile(
                      title: Text('Step 2'),
                    ),
                    ListTile(
                      title: Text('Step 3'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: 400.0,
                  height: 200.0,
                  child: Column(children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      child: Image(image: null),
                    ),
                    Text('Published by'),
                    Text(
                      'Author Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    Text('on "Date Published"')
                  ]))
            ],
          ),
        ]));
  }
}
