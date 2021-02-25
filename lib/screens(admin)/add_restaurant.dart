import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddRestaurant extends StatefulWidget {
  @override
  _AddRestaurantState createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();

  Future choiceGallery() async {
    final pickedImage = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedImage.path);
    });
  }

  Future choiceCamera() async {
    final pickedImage = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(pickedImage.path);
    });
  }

  Future addData(File imageFile) async {
    try {
      String username = usernameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String contact = contactController.text;
      String address = addressController.text;

      var url = Uri.parse(
          'https://czechoslovakian-scr.000webhostapp.com/add_restaurant.php');

      var request = http.MultipartRequest("POST", url);

      request.fields['name'] = "";

      var pic = await http.MultipartFile.fromPath("image", imageFile.path);

      String image = pic.filename;

      request.files.add(pic);
      var uploadresponse = await request.send();

      if (uploadresponse.statusCode == 200) {
        print("image uploaded");
      } else {
        print("uploaded failed");
      }

      var data = {
        'Restaurant_Name': username,
        'Password': password,
        'Email': email,
        'Contact': contact,
        'Address': address,
        'Usertype': 'Restaurant',
        'name': "",
        'profile': image
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message.contains('Registration Success!')) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Added New Restaurant'),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/admin_home');
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
              title: new Text('This Restaurant Existed'),
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
      appBar: AppBar(
        actions: [],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Center(
              child: Text('New Restaurant',
                  style: GoogleFonts.inter(
                      fontSize: 35, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            restpic(),
            inputRestaurantName(),
            inputEmail(),
            inputPassword(),
            inputAddress(),
            inputContact(),
            buttonAddURestaurant()
          ],
        ),
      ),
    );
  }

  Widget restpic() {
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
                  choiceCamera();
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  choiceGallery();
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget inputRestaurantName() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: TextField(
        controller: usernameController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Restaurant Name',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
  }

  Widget inputPassword() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
  }

  Widget inputEmail() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email Address',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
  }

  Widget inputContact() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: contactController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Contact Number',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
  }

  Widget inputAddress() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: addressController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Address',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
  }

  Widget buttonAddURestaurant() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Add Restaurant',
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
}
