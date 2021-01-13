import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdp_project/Home/restaurant_home.dart';

class EditProfile extends StatefulWidget {  
  
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfile> {  
  PickedFile _imageFile;  
  final ImagePicker _picker = ImagePicker();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 16,top: 25,right: 16),
          child:GestureDetector(
            onTap: (){
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
                  }
                ),
              ),
                Center(
                  child:Text(
                  "Edit Profile",
                  style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height:15),
                Center(child:Stack(
                  children:<Widget>[
                CircleAvatar(
                  radius:50,
                  backgroundImage: _imageFile==null
                  ? AssetImage("assets/KFC.png")
                  : FileImage(File(_imageFile.path)),
                   ),
                Positioned(
                  bottom:10,
                  left:65,
                  child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                  context: context, 
                  builder: ((builder) => bottomsheet()),
                    );
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.teal,
                    size: 28,
                            )
                          ),
                        )                  
                      ]
                    ),
                  ),
                  SizedBox(height:5),
                  buildTextField("Restaurant Name", "KFC",false),
                  buildTextField("Email", "kfc@mail.com",false),
                  buildTextField("No.Tel", "012-3456789",false),
                  buildTextField("Password", "********",true),
                  buildTextField("Address", "Batu Pahat",false),
                  SizedBox(height:10),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ButtonTheme(
                    height: 56,
                    child: RaisedButton(
                    child: Text('Update', style: TextStyle(color: Colors.white, fontSize: 20)),
                    color: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                   ),
                  onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RestaurantHome()));
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
  Widget buildTextField(
    String labaltext,String placeholder, bool isPasswordTextField){
    return Padding(
      padding: const EdgeInsets.only(bottom:20),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword :false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ? IconButton(
              onPressed: (){
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
               ),
              )
              :null,
        contentPadding: EdgeInsets.only(bottom:3),
        labelText: labaltext,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black
          ),
        ),
      ),
    );
  }
  Widget bottomsheet(){return Container(
    height:100,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal:20,
      vertical:20,
    ),
    child: Column(
      children: <Widget>[
        Text(
          "Choose Profile photo",
        style:TextStyle(
          fontSize: 20,
          )
        ),
        SizedBox(
          height:20
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: (){
                takePhoto(ImageSource.camera);
              },
              label:Text("Camera"),
            ),  
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: (){
                takePhoto(ImageSource.gallery);
              },
              label:Text("Gallery"),
            ),            
          ],
        )
      ],
    ),
  );
  }
  void takePhoto(ImageSource source) async {
  final pickedFile = await _picker.getImage(
    source:source,
  );
  setState((){
    _imageFile = pickedFile;
  }
 );
}

}