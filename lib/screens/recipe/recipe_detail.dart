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
      body: ListView(
        children: <Widget>[
          Center(
              child: Text(
            'Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          )),
          Container(
            width: 80.0,
            height: 80.0,
            child: Image.network(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.thestar.com.my%2Ffood%2Feating-out%2F2020%2F02%2F28%2Fenjoy-value-for-money-pizza&psig=AOvVaw2GvEReG91Ytq38g_H_OaBm&ust=1607414307412000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjgjomzu-0CFQAAAAAdAAAAABAJ'),
          ),
          Text('Ingredients'),
          Text('Steps'),
        ],
      ),
    );
  }
}
