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
              Image.asset('logo.png'),
              fit: BoxFit.contain,
            ),
          ),
          Text('Ingredients'),
          Text('Steps'),
        ],
      ),
    );
  }
}
