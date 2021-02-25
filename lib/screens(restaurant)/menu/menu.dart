import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../bloc/menu/menuBloc.dart';
import '../../bloc/menu/menuModel.dart';
import '../../bloc/restaurant/restaurantBloc.dart';
import '../home/restaurant_home.dart';
import 'addMenu.dart';
import 'editMenu.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<MenuModel> data = [];

  @override
  void initState() {
    String resid = BlocProvider.of<RestaurantBloc>(context).resid;
    BlocProvider.of<MenuBloc>(context).add(
      FetchMenuData(resid),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = BlocProvider.of<MenuBloc>(context).result;

    return ListView(
      children: <Widget>[
        BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is LoadingMenu) {
              return LinearProgressIndicator();
            }
            if (state is MenuLoaded) {
              return Menu();
            }
            if (state is MenuFailedLoad) {
              return Menu();
            }
            return RestaurantHome();
          },
        ),
      ],
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MenuModel> data = BlocProvider.of<MenuBloc>(context).result;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(children: <Widget>[
                Text(
                  'Menu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  width: 230,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddMenu(),
                        ));
                  },
                  color: Colors.deepOrange,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    return Menulist(data[index]);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}

class Menulist extends StatelessWidget {
  final data;
  Menulist(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4 - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFECEFF1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            child: CachedNetworkImage(
              imageUrl:
                  'https://czechoslovakian-scr.000webhostapp.com/uploads(Menu)/${data.image}',
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.30,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      height: 70,
                      width: 160,
                      child: Column(
                        children: [
                          Text(
                            data.menuname,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'RM ${data.price}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMenu(data),
                              ),
                            );
                          },
                          color: Colors.green,
                          shape: CircleBorder(
                            side: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            var url =
                                'https://czechoslovakian-scr.000webhostapp.com/delete_menu.php';
                            http.post(url, body: {'id': data.menuid});
                            Navigator.pop(context);
                          },
                          color: Colors.red,
                          shape: CircleBorder(
                            side: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ))
        ]));
  }
}
