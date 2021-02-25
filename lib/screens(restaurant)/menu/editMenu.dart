import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdp_project/bloc/menu/menuBloc.dart';
import 'package:sdp_project/bloc/restaurant/restaurantBloc.dart';
import 'package:http/http.dart' as http;

class EditMenu extends StatefulWidget {
  final data;
  EditMenu(this.data);
  @override
  _EditMenuPageState createState() => _EditMenuPageState(data);
}

class _EditMenuPageState extends State<EditMenu> {
  final data;
  _EditMenuPageState(this.data);
  File _imageFile;
  final ImagePicker _picker = ImagePicker();

  final menunameController = TextEditingController();
  final priceController = TextEditingController();

  Future editMenu(File imageFile) async {
    String menuid = data.menuid;
    try {
      String menuname = menunameController.text;

      String price = priceController.text;

      var url = Uri.parse(
          'https://czechoslovakian-scr.000webhostapp.com/edit_menu.php');

      var request = http.MultipartRequest("POST", url);

      request.fields['name'] = "";

      var pic = await http.MultipartFile.fromPath("image", imageFile.path);

      String image = pic.filename;

      String resid = BlocProvider.of<RestaurantBloc>(context).resid;

      request.files.add(pic);
      var uploadresponse = await request.send();

      if (uploadresponse.statusCode == 200) {
        print("image uploaded");
      } else {
        print("uploaded failed");
      }

      var data = {
        'Menu_ID': menuid,
        'Menu_Name': menuname,
        'Category': _categorylist,
        'Price': price,
        'Restaurant_ID': resid,
        'name': "",
        'profile': image
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message.contains('Menu Updated!')) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Updated This Menu'),
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

  String title = 'DropDownButton';
  String _categorylist;
  List _categoryname = ['Main Dishes', 'Snacks', 'Drinks'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<MenuBloc>(context).add(
              FetchMenuData(BlocProvider.of<RestaurantBloc>(context).resid),
            );
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: <Widget>[
                Center(
                  child: Text(
                    "Edit Menu",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 15),
                Center(child: menupic()),
                TextField(
                  controller: menunameController,
                  decoration: InputDecoration(
                    labelText: "Menu Name",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: data.menuname,
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Category'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.4),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: DropdownButton(
                              hint: Text(data.category),
                              dropdownColor: Colors.grey,
                              elevation: 5,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 48,
                              isExpanded: true,
                              value: _categorylist,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
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
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: "Price (in RM)",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: data.price,
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
                      child: Text('Update Menu',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        editMenu(_imageFile);
                        Navigator.pop(context);
                        BlocProvider.of<MenuBloc>(context).add(
                          FetchMenuData(data.resid),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget menupic() {
    return Stack(children: <Widget>[
      Center(
        child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.deepOrange,
            child: _imageFile == null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      height: 120,
                      width: 120,
                      imageUrl:
                          'https://czechoslovakian-scr.000webhostapp.com/uploads(Menu)/${data.image}',
                      fit: BoxFit.fill,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      File(_imageFile.path),
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )),
      ),
      Positioned(
        bottom: 20,
        left: 190,
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
    ]);
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
      _imageFile = File(pickedFile.path);
    });
  }
}
