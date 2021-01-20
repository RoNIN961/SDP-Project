import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';
// import 'package:sdp_project/Menu/AddMenu.dart';
// import 'package:sdp_project/Menu/EditMenu.dart';

const MenuListData = [
  {
    'Menuname': 'Happy Meals',
    'Description': 'A Happy Meals',
    'imgUrl': 'assets/Happy Meals.jpg',
    'category': 'Main Dishes',
    'Price': '24.60',
  },
  {
    'Menuname': 'Lucky Meals',
    'Description': 'A Lucky Meals',
    'imgUrl': 'assets/Happy Meals.jpg',
    'category': 'Snacks',
    'Price': '34.70',
  },
  {
    'Menuname': 'Family Meals',
    'Description': 'A Family Meals',
    'imgUrl': 'assets/Happy Meals.jpg',
    'category': 'Drink',
    'Price': '14.50',
  },
];

// class MenuPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[Menu()],
//     );
//   }
// }
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();

  
  }

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin{

  TabController _tabController;
  

  @override

  void initState(){
    super.initState();
    _tabController = TabController(vsync: this,length: 3);
    }
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top:15,left:10),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child:SizedBox(
            height:30,
            child:TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              controller: _tabController,
              indicator: BoxDecoration(
                color:Color(0x55B71C1C),
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              ),
              tabs: <Widget>[
                Tab(
                  text:'Main Dishes',
                ),
                Tab(
                  text:'Snacks',
                ),
                Tab(
                  text:'Drink',
                ),
              ],
              )
            )
          ),
          // Expanded(
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: <Widget>[
          //     ],
          //   ),
          // )
        ],
      )
    );
  }
}

// class Menu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                   children:<Widget>[
//               Text(
//                 'Menu',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//               ),
//               SizedBox(
//                 width:190,
//               ),
//               MaterialButton(
//                 onPressed: () {  
//                   Navigator.push(
//                     context,
//                   MaterialPageRoute(
//                     builder: (context) => AddMenu(),
//                     )
//                   );                  
//                   },
//                     color: Colors.deepOrange,
//                     shape: CircleBorder(
//                         side: BorderSide(
//                           color: Colors.deepOrange,
//                         ),
//                         ),
//                     child: Icon(
//                       Icons.add,
//                       size:24,
//                       color:Color(0xffFF8573),
//                     ),
//                   ),
//                 ]
//               ),
              
//               // Container(
//               //   height: 40,
//               //   child:ListView(scrollDirection: Axis.horizontal,
//               //   children: <Widget>[
//               //     category("Main Dishes", true),
//               //     category("Snacks", false),
//               //     category("Drink", false),
//               //    ],
//               //   )
//               // ),
//               SizedBox(
//                 height:10,
//               ),

//               Menulist(MenuListData[0]),
//               Menulist(MenuListData[1]),
//               Menulist(MenuListData[2]),
//           ],
//         )
//       ),
//     );
//   }
// }

// Container category(String label, bool isActive){
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal:10),
//     child: Chip(
//       label:Text(
//         label,
//       style:TextStyle(color: Colors.white,fontSize: 16),
//       ),
//       backgroundColor: isActive ?Colors.orange :Colors.grey,
//       ),
//   );
// }

// class Menulist extends StatelessWidget {
//   final menulist;
//   Menulist(this.menulist);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 1),
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height / 4 - 20,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Color(0xFFECEFF1),
//       ),
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//             top: 10,
//             left: 10,
//             child: Image.asset(
//               menulist['imgUrl'],
//               height: MediaQuery.of(context).size.height * 0.20,
//               width: MediaQuery.of(context).size.width * 0.30,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 20, left: 140),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   children:<Widget>[
//                 Text(
//                   menulist['Menuname'],
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                 ),
//                 MaterialButton(
//                       onPressed: () {  
//                     Navigator.push(
//                       context,
//                     MaterialPageRoute(
//                       builder: (context) => EditMenu(),
//                     )
//                   );                  
//                  },
//                       color: Colors.green,
//                       shape: CircleBorder(
//                       side: BorderSide(
//                       color: Colors.green,
//                       ),
//                     ),
//                     child: Icon(
//                       Icons.edit,
//                       size:24,
//                       color:Colors.white,
//                     ),
//                   ),
//                   ]
//                 ),
                
//                 Text(
//                   menulist['Description'],
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   children:<Widget>[
//                     Text(
//                       'RM ${menulist['Price']} ',
//                       style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(
//                       width:30
//                     ),
                    
//                    MaterialButton(
//                       onPressed: () {  
                                   
//                    },
//                       color: Colors.red,
//                       shape: CircleBorder(
//                       side: BorderSide(
//                       color: Colors.red,
//                       ),
//                     ),
//                     child: Icon(
//                       Icons.delete,
//                       size:24,
//                       color:Colors.white,
//                     ),
//                   ),
//                   ],
//                 ),
//               ],
//             ) 
//           )
//         ]
//       )
//     );
//   }
// }

//  void _tabBarItemsTapped(int newValue) {
//     setState(() {
//       _selectedCategory = newValue;
//     });
//     _tabBarFilterSwitch(newValue);
//     print(_selectedCategory);
//   }


//  void _tabBarFilterSwitch(filterNumb) {
//     if (filterNumb == 0) {
//       _dropdownList = _usage;
//     } else if (filterNumb == 1) {
//       _dropdownList = _category;
//     } else if (filterNumb == 2) {
//       _dropdownList = _category;
//     } else if (filterNumb == 3) {
//       _dropdownList = _category;
//     }
//     print(_dropdownList);
//   }

// void _filterProductList(int value, category, filter) {
//     List tempProducts = [];

//     switch (value) {
//       case 0:
//           for (int i = 0; i < category.length; i++) {
//         tempProducts.add(category[i].category.contains(filter[i]));
//             // tempProducts = productList
//             // tempProducts.
//             category =[];
//             setState(()=>category = tempProducts);
//             print(tempProducts[i].name);

//           }
//         break;
//       case 1:
//             for (int i = 0; i < category.length; i++) {
//         tempProducts.add(category[i].category.contains(filter[i]));
//             // tempProducts = productList
//             // tempProducts.
//             category =[];
//             setState(()=>category = tempProducts);
//             print(tempProducts[i].name);
//           }
//         break;
//       case 2:
//             for (int i = 0; i < category.length; i++) {
//         tempProducts.add(category[i].category.contains(filter[i]));
//             // tempProducts = productList
//             // tempProducts.
//             category =[];
//             setState(()=>category = tempProducts);
//             print(tempProducts[i].name);
//           }
//         break;
//       case 3:
//             for (int i = 0; i < category.length; i++) {
//         tempProducts.add(category[i].category.contains(filter[i]));
//             // tempProducts = productList
//             // tempProducts.
//             category =[];
//             setState(()=>category = tempProducts);
//             print(tempProducts[i].name);
//           }
//         break;
//     }
//     return;
// }