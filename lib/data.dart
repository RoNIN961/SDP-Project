import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin_ui/navbar.dart';
import 'package:charts_flutter/flutter.dart';

class data extends StatefulWidget {
  @override
  _dataState createState() => _dataState();
}

class _dataState extends State<data> {
  @override
   String restaurants='90';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Statistics"),
          ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12,bottom: 12),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 200,width: 390,
                      child: Card(
                        shadowColor: Colors.deepOrange,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Text('Total Restaurant Associated', style: GoogleFonts.inter(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepOrange
                              ),),
                              Text('Total: '+restaurants,style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ))]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10,right: 10),
              child: Container(
                height: 200,width: 310,
                child: Card(
                  shadowColor: Colors.deepOrange,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text('Total Users', style: GoogleFonts.inter(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepOrange
                        ),),
                        Text('Total: '+restaurants,style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ))]
                  ),
                ),
              ),
            )
          ],
        )
      );
  }
}



