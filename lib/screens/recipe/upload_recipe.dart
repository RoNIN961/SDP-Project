import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sdp_project/theme/custom.dart';

class UploadRecipePage extends StatefulWidget {
  _UploadRecipePageState createState() => _UploadRecipePageState();
}

class _UploadRecipePageState extends State<UploadRecipePage> {
  final recipeTitleController = TextEditingController();
  final ingredientIDController = TextEditingController();
  final instructionIDController = TextEditingController();
  final imageIDController = TextEditingController();

  // Future uploadInstructions() async {
  //   try {
  //     String detail = instructionIDController.text;
  //     String step = ;

  //     var url = 'https://czechoslovakian-scr.000webhostapp.com/upload_instructions.php';

  //   }
  // }catch (e) {
  //     print(e.toString());
  //   }

  Future uploadRecipe() async {
    try {
      String recipeTitle = recipeTitleController.text;
      String ingredientsID = ingredientIDController.text;
      String instructionID = instructionIDController.text;
      String imageID = imageIDController.text;

      var url =
          'https://czechoslovakian-scr.000webhostapp.com/upload_recipe.php';

      var data = {
        'Recipe_Title': recipeTitle,
        'Ingredients_ID': ingredientsID,
        'Instruction_ID': instructionID,
        'Image_ID': imageID,
        'User_ID': '7',
        'Category': 'Unknown'
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      print(message);
      //var jsonResponse = jsonDecode(response.body);

      if (message == 'Upload Success!') {
        Navigator.pushNamed(context, '/');
      } else {
        // Showing Alert Dialog with Response JSON Message.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(message),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
      children: [
        SizedBox(
            width: 400.0,
            height: 200.0,
            child: InkWell(
              child: Text('Upload Recipe Image',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              onTap: () {},
            )),
        CustomTextField(
            text: 'Title:Ginger Chicken', controller: recipeTitleController),
        Container(
            child: Column(
          children: <Widget>[
            Title(
                color: Colors.black,
                child: Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                )),
            CustomTextField(
              text: '250g flour',
              controller: ingredientIDController,
            ),
            CustomTextField(
              text: '100ml water',
              controller: ingredientIDController,
            ),
            CustomButton3(
              onPressed: null,
              text: 'add ingredients',
            )
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
            CustomTextField(
              text: 'Step 1',
              controller: instructionIDController,
            ),
            CustomTextField(
              text: 'Step 2',
              controller: instructionIDController,
            ),
            CustomButton3(
              onPressed: null,
              text: 'add steps',
            )
          ],
        )),
        CustomButton3(
          onPressed: uploadRecipe,
          text: 'Upload Recipe',
        )
      ],
    )));
  }
}
