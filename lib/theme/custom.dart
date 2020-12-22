import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: text,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0))),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class CustomHiddenTextField extends StatelessWidget {
  CustomHiddenTextField({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              hintText: text,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0))),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class CustomButton1 extends StatelessWidget {
  CustomButton1({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: ButtonTheme(
          height: 56,
          child: RaisedButton(
            child:
                Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
            color: Colors.black87,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: onPressed,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class CustomButton2 extends StatelessWidget {
  CustomButton2({@required this.onPressed, this.text,this.color});
  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: FlatButton(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          onPressed: onPressed),
      onPressed: onPressed,
    );
  }
}
