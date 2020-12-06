import 'package:flutter/material.dart';
import 'recipe_model.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe recipe;

  RecipeScreen({this.mealType, this.recipe});
  
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.orange,
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
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.black12,
            //width: double.infinity,
            child: Text(
                'Ingredients 1\n-               Ingredients 2' +
                    'Ingredients 3',
                style: (TextStyle(fontSize: 20)),
                textAlign: TextAlign.justify),
          ),
        ),
      ],
    );
  }
}
