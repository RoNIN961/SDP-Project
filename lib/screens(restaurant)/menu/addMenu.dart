import 'dart:io';

import 'package:flutter/material.dart';
import 'menu.dart';
import 'package:image_picker/image_picker.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuPageState createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenu> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  String title = 'DropDownButton';
  String _categorylist;
  List _categoryname = ['Main Dishes', 'Snacks', 'Drinks'];
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
            inputMenuName(),
            inputDescription(),
            inputCategory(),
            inputPrice(),
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
              ? AssetImage("assets/personicon.png")
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

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget inputMenuName() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'MenuName',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
  }

  Widget inputDescription() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Description',
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
            )));
  }

  Widget inputPrice() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Menu()));
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
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

// }
// class Bottomsheet extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     height:100,
//     width: MediaQuery.of(context).size.width,
//     margin: EdgeInsets.symmetric(
//       horizontal:20,
//       vertical:20,
//     ),
//     child: Column(
//       children: <Widget>[
//         Text(
//           "Choose Profile photo",
//         style:TextStyle(
//           fontSize: 20,
//           )
//         ),
//         SizedBox(
//           height:20
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.camera),
//               onPressed: (){

//               },
//               label:Text("Camera"),
//             ),
//             FlatButton.icon(
//               icon: Icon(Icons.image),
//               onPressed: (){

//               },
//               label:Text("Gallery"),
//             ),
//           ],
//         )
//       ],
//     ),
//   );
//  }
// }

//   final menupic = Stack(
//   children:<Widget>[
//   CircleAvatar(
//     radius:70,
//     backgroundImage:(AssetImage("assets/Yukinoshita Yukino.jpg")),
//     ),
//     Positioned(
//     bottom:20,
//     left:90,
//     child: InkWell(
//       onTap: (){
//         showModalBottomSheet(
//           context: context,
//           builder: ((builder) => Bottomsheet()),
//         );
//       },
//       child: Icon(
//         Icons.camera_alt,
//         color: Colors.teal,
//         size: 28,
//       )
//       ),
//     )
//   ]
// );

// final inputMenuName= Padding(
//   padding: EdgeInsets.only(top:20,bottom: 10),
//   child: TextField(
//     keyboardType: TextInputType.emailAddress,
//     decoration: InputDecoration(
//       hintText: 'MenuName',
//       contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(50.0)
//       )
//     ),
//   ),
// );
// final inputDescription = Padding(
//   padding: EdgeInsets.only(bottom: 10),
//   child: TextField(
//     keyboardType: TextInputType.emailAddress,
//     decoration: InputDecoration(
//       hintText: 'Description',
//       contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(50.0)
//       )
//     ),
//   ),
// );
// final inputCategory = Padding(
//   padding: EdgeInsets.only(bottom: 10),
//   child: Container(
//     padding: EdgeInsets.only(left:16,right:16),
//     decoration: BoxDecoration(
//       border: Border.all(width:1),
//       borderRadius: BorderRadius.circular(50.0),
//     ),
//     child: DropdownButton(
//       hint: Text(
//         'SelectCategory'
//         ),
//       dropdownColor: Colors.grey,
//       elevation: 5,
//       icon: Icon(Icons.arrow_drop_down),
//       iconSize: 48,
//       isExpanded: true,
//       value: _categorylist,
//       style: TextStyle(color: Colors.black,fontSize: 22),
//       onChanged: (value){
//         setState(() {
//           _categorylist = value;
//         });
//       },
//       items: _categoryname.map((value) {
//         return DropdownMenuItem(
//           value: value,
//           child: Text(value),);
//       }).toList(),
//     )
//   )
// );
// final inputPrice = Padding(
//   padding: EdgeInsets.only(bottom: 10),
//   child: TextField(
//     keyboardType: TextInputType.emailAddress,
//     decoration: InputDecoration(
//       hintText: 'Price (in RM)',
//       contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(50.0)
//       )
//     ),
//   ),
// );
// final buttonRegister = Padding(
//   padding: EdgeInsets.only(bottom: 15),
//   child: ButtonTheme(
//     height: 56,
//     child: RaisedButton(
//       child: Text('Add Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
//       color: Colors.lightBlue,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(50)
//       ),
//       onPressed: () {
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Menu()));
//       },
//     ),
//   ),
// // );
// final buttonBack = Padding(
//   padding: EdgeInsets.only(bottom: 20),
//   child: ButtonTheme(
//     height: 56,
//     child: RaisedButton(
//       child: Text('Back', style: TextStyle(color: Colors.white, fontSize: 20)),
//       color: Colors.black12,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(50)
//       ),
//       onPressed: () {
//           Navigator.pop(context);
//       },
//     ),
//   ),
// );
// // return SafeArea(
//   child: Scaffold(
//     body: Center(
//       child: ListView(
//         shrinkWrap: true,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         children: <Widget>[
//           menupic,
//           inputMenuName,
//           inputDescription,
//           inputCategory,
//           inputPrice,
//           buttonRegister,
//           buttonBack,//test
//         ],
//       ),
//     ),
//   )
// );
//   }
// }

// Widget menupic(){
//   return Stack(
//   children:<Widget>[
//     CircleAvatar(
//       radius:70,
//       backgroundImage:(AssetImage("assets/Yukinoshita Yukino.jpg")),
//       ),
//       Positioned(
//       bottom:20,
//       left:90,
//       child: InkWell(
//         onTap: (){
//           showModalBottomSheet(
//             context: context,
//             builder: ((builder) => bottomsheet()),
//           );
//         },
//         child: Icon(
//           Icons.camera_alt,
//           color: Colors.teal,
//           size: 28,
//         )
//         ),
//       )
//     ]
//   );
// }

// Widget bottomsheet(){
//   return Container(
//     height:100,
//     width: MediaQuery.of(context).size.width,
//     margin: EdgeInsets.symmetric(
//       horizontal:20,
//       vertical:20,
//     ),
//     child: Column(
//       children: <Widget>[
//         Text(
//           "Choose Profile photo",
//         style:TextStyle(
//           fontSize: 20,
//           )
//         ),
//         SizedBox(
//           height:20
//         ),
//         Row(
//           children: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.camera),
//               onPressed: (){

//               },
//               label:Text("Camera"),
//             ),
//             FlatButton.icon(
//               icon: Icon(Icons.image),
//               onPressed: (){

//               },
//               label:Text("Gallery"),
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }
