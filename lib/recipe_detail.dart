import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(
                "Recipe Name ",
                textScaleFactor: 2,
                style: (TextStyle(fontSize: 20)),
                textAlign: TextAlign.center,
              )),
        ),
        Expanded(
          flex: 6,
          child: Container(
            width: double.infinity,
            child: Image.network(
              'logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            padding: EdgeInsets.all(20),
            child: <Widget>[
                Text('Ingredient 1'),
                Text('Ingredient 2')
                style: (TextStyle(fontSize: 20)),
                textAlign: TextAlign.justify
            ],
          ),
        ),
      ],
    );
  }
}
