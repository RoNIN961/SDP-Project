import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sdp_project/bloc/menu/menuBloc.dart';

import '../../bloc/restaurant/restaurantBloc.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuPageState createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenu> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();

  String title = 'DropDownButton';
  String _categorylist;
  List _categoryname = ['Main Dishes', 'Snacks', 'Drinks'];

  final menunameController = TextEditingController();
  final priceController = TextEditingController();

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future addData(File imageFile) async {
    try {
      String menuname = menunameController.text;

      String price = priceController.text;

      var url = Uri.parse(
          'https://czechoslovakian-scr.000webhostapp.com/add_menu.php');

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
        'Menu_Name': menuname,
        'Category': _categorylist,
        'Price': price,
        'Restaurant_ID': resid,
        'name': "",
        'profile': image
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message.contains('Menu Added!')) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Added New Menu'),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            menupic(),
            SizedBox(
              height: 20,
            ),
            inputMenuName(),
            SizedBox(
              height: 20,
            ),
            inputCategory(),
            SizedBox(
              height: 20,
            ),
            inputPrice(),
            SizedBox(
              height: 30,
            ),
            buttonAddMenu(),
            buttonBack(), //test
          ],
        ),
      ),
    ));
  }

  Widget menupic() {
    return Stack(children: <Widget>[
      Center(
        child: CircleAvatar(
          radius: 70,
          backgroundColor: Color(0xFFECEFF1),
          backgroundImage: _imageFile == null
              ? AssetImage("assets/logo2.png")
              : FileImage(File(_imageFile.path)),
        ),
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

  Widget inputMenuName() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: TextField(
        controller: menunameController,
        decoration: InputDecoration(
            hintText: 'Menu Name',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
  }

  Widget inputCategory() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
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

  Widget inputPrice() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: priceController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Price (in RM)',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
  }

  Widget buttonAddMenu() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Add Menu',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.lightBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            addData(_imageFile);
          },
        ),
      ),
    );
  }

  Widget buttonBack() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child:
              Text('Back', style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.black12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            BlocProvider.of<MenuBloc>(context).add(
              FetchMenuData(BlocProvider.of<RestaurantBloc>(context).resid),
            );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
