import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('Name'),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('logo.png'),
            ),
          ),
          Text('Ingredients'),
          Text('Steps'),
        ],
      ),
    );
  }
}
