import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sdp_project/theme/custom.dart';
import 'package:image_picker/image_picker.dart';

class UploadRecipePage extends StatefulWidget {
  _UploadRecipePageState createState() => _UploadRecipePageState();
}

class _UploadRecipePageState extends State<UploadRecipePage> {
  PickedFile _image;
  // ignore: unused_field
  dynamic _pickImageError;
  final titleController = TextEditingController();
  final detailController = TextEditingController();
  final ingredientController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    try {
      final pickedFile = await _picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      setState(() {
        _image = pickedFile;
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
        _image = pickedFile;
      });
      print(_image.path);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(e);
    }
  }

  Future uploadRecipe() async {
    try {
      String title = titleController.text;
      String detail = detailController.text;
      String category = CustomDropDownButton() as String;

      var url =
          'https://czechoslovakian-scr.000webhostapp.com/upload_recipe.php';

      var data = {
        'Recipe_Title': title,
        'Detail': detail,
        'Category': category
      };

      print(category);
      var response = await http.post(url, body: data);

      var message = response.body;

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['message'] == 'Upload Success') {
        print(category);
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

  List<DynamicWidget> listDynamic = [];

  List<String> data = [];

  addDynamic() {
    if (data.length != 0) {
      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 5) {
      return;
    }
    listDynamic.add(new DynamicWidget());
  }

  @override
  Widget build(BuildContext context) {
    Widget result = new Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${data[index]}"),
                    ),
                    new Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField = new Flexible(
        flex: 2,
        child: new ListView.builder(
          itemCount: listDynamic.length,
          itemBuilder: (context, index) => listDynamic[index],
        ));

    return Scaffold(
        body: Container(
            child: ListView(
      children: [
        SizedBox(
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
                ))),
        Column(children: <Widget>[
          CustomTextField(
              text: 'Title:Ginger Chicken', controller: titleController),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                CustomDropDownButton()
              ])
        ]),
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
                text: '250g flour', controller: ingredientController),
            data.length == 0 ? dynamicTextField : result,
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
              onPressed: addDynamic(),
              text: 'add ingredients',
            )
          ],
        )),
        CustomButton3(text: 'Upload Recipe', onPressed: uploadRecipe)
      ],
    )));
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

class DynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: new CustomTextField(
        controller: controller,
        text: 'Steps',
      ),
    );
  }
}
