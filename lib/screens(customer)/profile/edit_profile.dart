import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../bloc/login/loginBloc.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool showPassword = false;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future editProfile() async {
    try {
      String username = usernameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String userid = BlocProvider.of<LoginBloc>(context).userid;

      var url =
          'https://czechoslovakian-scr.000webhostapp.com/edit_profile.php';

      var data = {
        'userid': userid,
        'username': username,
        'password': password,
        'email': email,
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message == 'Successfully updated!') {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully Registered'),
          ),
        );
        Navigator.pushNamed(context, '/');
      } else {
        // Showing Alert Dialog with Response JSON Message.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Center(
                child: Text(message),
              ),
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
    String username = BlocProvider.of<LoginBloc>(context).name;
    String useremail = BlocProvider.of<LoginBloc>(context).email;

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
                      radius: 50,
                      backgroundImage: _imageFile == null
                          ? AssetImage("assets/personicon.jpg")
                          : FileImage(File(_imageFile.path)),
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
                      ),
                    )
                  ]),
                ),
                SizedBox(height: 5),
                buildUsernameTextField("Username", username, false),
                buildPasswordTextField("Password", '*********', true),
                buildEmailTextField("Email", useremail, false),
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
                        editProfile();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildUsernameTextField(
      String labaltext, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: usernameController,
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

  Widget buildEmailTextField(
      String labaltext, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: emailController,
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

  Widget buildPasswordTextField(
      String labeltext, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: passwordController,
        obscureText: isPasswordTextField ? showPassword : true,
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
          labelText: labeltext,
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
      _imageFile = pickedFile;
    });
  }
}
