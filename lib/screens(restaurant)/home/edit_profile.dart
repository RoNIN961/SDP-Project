import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdp_project/bloc/login/loginBloc.dart';
import 'package:sdp_project/bloc/restaurant/restaurantBloc.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfile> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();

  final resnameController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();

  Future editProfile(File imageFile) async {
    try {
      String resname = resnameController.text;
      String contact = contactController.text;
      String address = addressController.text;

      var url = Uri.parse(
          'https://czechoslovakian-scr.000webhostapp.com/edit_profile(Restaurant).php');

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
        'resname': resname,
        'contact': contact,
        'address': address,
        'Restaurant_ID': resid,
        'name': "",
        'profile': image,
        'userid': BlocProvider.of<LoginBloc>(context).userid,
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message.contains('Profile Updated!')) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Profile Updated Successfully'),
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
              title: new Text('Failed to update profile'),
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

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    String image = BlocProvider.of<RestaurantBloc>(context).image;
    String resname = BlocProvider.of<RestaurantBloc>(context).resname;

    String contact = BlocProvider.of<RestaurantBloc>(context).contact;
    String address = BlocProvider.of<RestaurantBloc>(context).address;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
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
                    "Edit Profile",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Stack(children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      radius: 70,
                      child: _imageFile == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                height: 120,
                                width: 120,
                                fit: BoxFit.fill,
                                imageUrl:
                                    'https://czechoslovakian-scr.000webhostapp.com/uploads(Profile)/$image',
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
                            ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 65,
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
                SizedBox(height: 5),
                buildNameTextField("Restaurant Name", resname, false),
                buildContactTextField("No.Tel", contact, false),
                buildAddressTextField("Address", address, false),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ButtonTheme(
                    height: 56,
                    child: RaisedButton(
                      child: Text('Update',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        editProfile(_imageFile);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildNameTextField(
      String labaltext, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: resnameController,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labaltext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildContactTextField(
      String labaltext, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: contactController,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labaltext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildAddressTextField(
      String labaltext, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: addressController,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labaltext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
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
      _imageFile = File(pickedFile.path);
    });
  }
}
