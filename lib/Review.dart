import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[Review()],
    );
  }
}
class Review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height:20,
                ),
              Text(
                'Review',
                style: TextStyle(
                  fontWeight:FontWeight.bold, 
                  fontSize: 24
                )
              )
            ]
          )
        )
    );
  }
}