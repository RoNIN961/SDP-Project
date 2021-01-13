import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sdp_project/Menu/AddMenu.dart';

const MenuListData = [
  {
    'Cus_Name': 'Happy Meals',
    'total_review': '100',
    'Email': 'luiyande5678@gmail.com',
    'imgUrl': 'assets/Happy Meals.jpg',
    'total_rating': '4.6',
  },
  {
    'Cus_Name': 'Happy Meals',
    'total_review': '90',
    'Email': 'mirz666a@gmail.com',
    'imgUrl': 'assets/Happy Meals.jpg',
    'total_rating': '4.7',
  },
  {
    'Cus_Name': 'Happy Meals',
    'total_review': '70',
    'Email': 'lim222@gmail.com',
    'imgUrl': 'assets/Happy Meals.jpg',
    'total_rating': '4.5',
  },
];

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[Menu()],
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                  children:<Widget>[
              Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                width:190,
              ),
              MaterialButton(
                onPressed: () {  
                  Navigator.push(
                    context,
                  MaterialPageRoute(
                    builder: (context) => AddMenu(),
                    )
                  );                  
                  },
                    color: Colors.deepOrange,
                    shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.deepOrange,
                        ),
                        ),
                    child: Icon(
                      Icons.add,
                      size:24,
                      color:Color(0xffFF8573),
                    ),
                  ),
                ]
              ),
              Menulist(MenuListData[0]),
              Menulist(MenuListData[1]),
              Menulist(MenuListData[2]),
          ],
        )
      ),
    );
  }
}

class Menulist extends StatelessWidget {
  final menulist;
  Menulist(this.menulist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFECEFF1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            child: Image.asset(
              menulist['imgUrl'],
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  menulist['Cus_Name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10
                ),
                Text(
                  '${menulist['total_review']} total reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children:<Widget>[
                    Icon(
                      Icons.star,
                      size:16,
                      color:Color(0xffFF8573),
                    ),
                    SizedBox(width:5),
                    Text(
                      menulist['total_rating'],
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width:40),
                    MaterialButton(
                      onPressed: () {                    
                  },
                    color: Color(0xff4E2958),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'View Menu',
                      style: TextStyle(
                        color: Colors.white,
                          ),
                        )
                      ),
                  ],
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}