import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sdp_project/theme/custom.dart';

class UploadRecipePage extends StatefulWidget {
  _UploadRecipePageState createState() => _UploadRecipePageState();
}

class _UploadRecipePageState extends State<UploadRecipePage> {
  final titleController = TextEditingController();
  final detailController = TextEditingController();
  final categoryController = CustomDropDownButton();

  Future uploadRecipe() async {
    try {
      String title = titleController.text;
      String detail = detailController.text;
      String category = categoryController.toString();

      var url =
          'https://czechoslovakian-scr.000webhostapp.com/upload_recipe.php';

      var data = {
        'Recipe_Title': title,
        'Detail': detail,
        'Category': category
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['message'] == 'Upload Success') {
      } else {
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
            text: 'Title:Ginger Chicken', controller: titleController),
        CustomDropDownButton(),
        Container(
            child: Column(
          children: <Widget>[
            Title(
                color: Colors.black,
                child: Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                )),
            Column(children: <Widget>[
              Row(children: <Widget>[
                TextFormField(
                  enableInteractiveSelection: false,
                  initialValue: step,
                ),
                CustomTextField(text: '250g flour')
              ])
            ]),
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
            ),
            CustomButton3(
              onPressed: null,
              text: 'add steps',
            )
          ],
        )),
        CustomButton3(
          text: 'Upload Recipe',
          onPressed: null,
        )
      ],
    )));
  }
}

int stepNumber = 1;
String step = "$stepNumber";
