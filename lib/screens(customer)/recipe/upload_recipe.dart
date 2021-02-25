import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../bloc/login/loginBloc.dart';
import '../../theme/custom.dart';

class UploadRecipePage extends StatefulWidget {
  _UploadRecipePageState createState() => _UploadRecipePageState();
}

class _UploadRecipePageState extends State<UploadRecipePage> {
  File _image;
  // ignore: unused_field
  dynamic _pickImageError;
  final titleController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String title = 'DropDownButton';
  String _categorylist;
  List _categoryname = ['Halal', 'Non-Halal'];

  Future addRecipe(File imageFile) async {
    try {
      String title = titleController.text;

      var url = Uri.parse(
          'https://czechoslovakian-scr.000webhostapp.com/upload_recipe.php');

      var request = http.MultipartRequest("POST", url);

      request.fields['name'] = "";

      var pic = await http.MultipartFile.fromPath("image", imageFile.path);

      String image = pic.filename;

      String userid = BlocProvider.of<LoginBloc>(context).userid;

      request.files.add(pic);
      var uploadresponse = await request.send();

      if (uploadresponse.statusCode == 200) {
        print("image uploaded");
      } else {
        print("uploaded failed");
      }

      var data = {
        'title': title,
        'category': _categorylist,
        'image': image,
        'userid': userid,
        'name': "",
        'detail': convertStep(),
        'ingredient': convertIngredient(),
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message.contains('Successfully Added!')) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Added New Recipe!'),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
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

  String convertStep() {
    String steparray = '';
    for (int i = 0; i < step.length; i++) {
      steparray += step[i] + (i == step.length - 1 ? '' : ',');
    }
    return steparray;
  }

  String convertIngredient() {
    String ingredientarray = '';
    for (int i = 0; i < ingredient.length; i++) {
      ingredientarray +=
          ingredient[i] + (i == ingredient.length - 1 ? '' : ',');
    }
    return ingredientarray;
  }

  _imgFromCamera() async {
    try {
      final pickedFile = await _picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      setState(() {
        _image = File(pickedFile.path);
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(e);
    }
  }

  _imgFromGallery() async {
    try {
      final pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      setState(() {
        _image = File(pickedFile.path);
      });
      print(_image.path);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(e);
    }
  }

  List<DynamicStep> listStep = [];
  List<DynamicIngredient> listIngredient = [];

  List<String> step = [];
  List<String> ingredient = [];

  addStep() {
    if (step.length != 0) {
      step = [];
      listStep = [];
      print('if');
    }
    setState(() {});
    if (listStep.length >= 5) {
      return;
    }
    listStep.add(new DynamicStep());
  }

  addIngredient() {
    if (ingredient.length != 0) {
      ingredient = [];
      listIngredient = [];
      print('if');
    }
    setState(() {});
    if (listIngredient.length >= 5) {
      return;
    }
    listIngredient.add(new DynamicIngredient());
  }

  @override
  Widget build(BuildContext context) {
    Widget ingredientResult = new Container(
        // child: new Card(
        //   child: ListView.builder(
        //     itemCount: ingredient.length,
        //     itemBuilder: (_, index) {
        //       return new Padding(
        //         padding: new EdgeInsets.all(10.0),
        //         child: new Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             new Container(
        //               margin: new EdgeInsets.only(left: 10.0),
        //               child: new Text("${index + 1} : ${ingredient[index]}"),
        //             ),
        //             new Divider()
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ),
        );

    Widget stepResult = new Container(
        // child: new Card(
        //   child: ListView.builder(
        //     itemCount: step.length,
        //     itemBuilder: (_, index) {
        //       return new Padding(
        //         padding: new EdgeInsets.all(10.0),
        //         child: new Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             new Container(
        //               margin: new EdgeInsets.only(left: 10.0),
        //               child: new Text("${index + 1} : ${step[index]}"),
        //             ),
        //             new Divider()
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ),
        );

    Widget dynamicIngredient = new Container(
      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: listIngredient.length,
        itemBuilder: (context, index) => listIngredient[index],
      ),
    );

    Widget dynamicStep = new Container(
      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: listStep.length,
        itemBuilder: (context, index) => listStep[index],
      ),
    );

    Widget inputCategory() {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          width: 180,
          padding: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: DropdownButton(
            hint: Text('Select Category'),
            dropdownColor: Colors.grey,
            elevation: 5,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 48,
            isExpanded: true,
            value: _categorylist,
            style: TextStyle(color: Colors.black, fontSize: 17),
            onChanged: (value) {
              setState(() {
                _categorylist = value;
              });
            },
            items: _categoryname.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    }

    return Scaffold(
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              child: SizedBox(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffFDCF09),
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(_image.path),
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
              ),
            ),
            Container(
                child: Column(children: <Widget>[
              SizedBox(height: 30),
              CustomTextField(
                  text: 'Title:Ginger Chicken', controller: titleController),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    inputCategory(),
                  ]),
              SizedBox(
                height: 30,
              ),
            ])),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                  color: Colors.black,
                  child: Text(
                    'Ingredients',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            Container(
              child:
                  ingredient.length == 0 ? dynamicIngredient : ingredientResult,
            ),
            CustomButton3(
              onPressed: addIngredient,
              text: 'add ingredients',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                  color: Colors.black,
                  child: Text(
                    'Steps',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            Container(
              child: step.length == 0 ? dynamicStep : stepResult,
            ),
            CustomButton3(
              onPressed: addStep,
              text: 'add steps',
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton1(
              text: 'Upload Recipe',
              onPressed: () {
                listIngredient.forEach((widget) =>
                    ingredient.add(widget.dynamicIngredientController.text));
                //ingredient is array of text editing controller text
                listStep.forEach(
                    (widget) => step.add(widget.dynamicStepController.text));
                //step is array of text editing controller text
                addRecipe(_image);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// ignore: must_be_immutable
class DynamicIngredient extends StatelessWidget {
  TextEditingController dynamicIngredientController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: new CustomTextField(
        controller: dynamicIngredientController,
        text: 'add ingredient here',
      ),
    );
  }
}

// ignore: must_be_immutable
class DynamicStep extends StatelessWidget {
  TextEditingController dynamicStepController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: new CustomTextField(
        controller: dynamicStepController,
        text: 'add step here',
      ),
    );
  }
}
