import 'package:flutter/material.dart';
import 'package:sdp_project/Menu/Menu.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuPageState createState() => _AddMenuPageState();
}
class _AddMenuPageState extends State<AddMenu> {
  String title = 'DropDownButton';
  String _categorylist;
  List _categoryname = ['Main Dishes', 'Snacks','Drinks'];
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.all(20),
        child: Hero(
        tag: 'hero',
        child: CircleAvatar(
          radius: 56.0,
          child: Image.asset('assets/logo.png'),
        )
      ),
    );
    final inputMenuName= Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'MenuName',
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          )
        ),
      ),
    );
    final inputDescription = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Description',
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          )
        ),
      ),
    );
    final inputCategory = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.only(left:16,right:16),
        decoration: BoxDecoration(
          border: Border.all(width:1),
          borderRadius: BorderRadius.circular(50.0),        
        ),
        child: DropdownButton(
          hint: Text(
            'SelectCategory'
            ),
          dropdownColor: Colors.grey,
          elevation: 5,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 48,
          isExpanded: true,
          value: _categorylist,
          style: TextStyle(color: Colors.black,fontSize: 22),
          onChanged: (value){
            setState(() {
              _categorylist = value;
            });
          },
          items: _categoryname.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),);
          }).toList(),
        )
      )
    );
    final inputPrice = Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Price (in RM)',
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          )
        ),
      ),
    );
    final buttonRegister = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Menu()));
          },
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              logo,

              inputMenuName,
              inputDescription,
              inputCategory,
              inputPrice,
              buttonRegister,//test
            ],
          ),
        ),
      )
    );
  }
}

