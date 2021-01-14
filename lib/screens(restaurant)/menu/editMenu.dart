import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'menu.dart';

class EditMenu extends StatefulWidget {
  @override
  _EditMenuPageState createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenu> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  String title = 'DropDownButton';
  String _categorylist;
  List _categoryname = ['Main Dishes', 'Snacks', 'Drinks'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 280),
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                Center(
                  child: Text(
                    "Edit Menu",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Stack(children: <Widget>[
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: _imageFile == null
                          ? AssetImage("assets/Happy Meals.jpg")
                          : FileImage(File(_imageFile.path)),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 90,
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomsheet()),
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.teal,
                            size: 28,
                          )),
                    )
                  ]),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Menu Name",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Happy Meal",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Description",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "A Happy Meals",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: DropdownButton(
                          hint: Text('SelectCategory'),
                          dropdownColor: Colors.grey,
                          elevation: 5,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 48,
                          isExpanded: true,
                          value: _categorylist,
                          style: TextStyle(color: Colors.black, fontSize: 22),
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
                        ))),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Price (in RM)",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "24.60",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: ButtonTheme(
                    height: 56,
                    child: RaisedButton(
                      child: Text('Add Menu',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Menu()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text("Choose Profile photo",
              style: TextStyle(
                fontSize: 20,
              )),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
