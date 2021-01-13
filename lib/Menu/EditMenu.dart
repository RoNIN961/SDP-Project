import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditMenu extends StatefulWidget {  
  
  @override
  _EditMenuPageState createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenu> {  
  PickedFile _imageFile;  
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 16,top: 25,right: 16),
          child: ListView(
            children: <Widget>[
              Text(
                "Edit Menu",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
                ),
                SizedBox(height:20),
                Center(child:Stack(
                  children:<Widget>[
                CircleAvatar(
                  radius:70,
                  backgroundImage: _imageFile==null
                  ? AssetImage("assets/Yukinoshita Yukino.jpg")
                  : FileImage(File(_imageFile.path)),
                   ),
                Positioned(
                  bottom:20,
                  left:90,
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
            )
          ],
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