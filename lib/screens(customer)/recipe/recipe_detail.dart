import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/bloc/recipe/recipeBloc.dart';
import 'package:sdp_project/bloc/recipe/recipeModel.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<RecipeBloc>(context).result.elementAt(0));

    List<RecipeModel> result = [];
    result = BlocProvider.of<RecipeBloc>(context).result;

    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          title: Text('My Flutter App'),
          actions: <Widget>[]),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Title(
                  color: Colors.black,
                  child: Text(result[0].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0))),
              SizedBox(
                width: 500.0,
                height: 200.0,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://czechoslovakian-scr.000webhostapp.com/uploads(Recipe)/${result.elementAt(0)}',
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  fadeOutDuration: new Duration(seconds: 1),
                  fadeInDuration: new Duration(seconds: 3),
                ),
              ),
              SizedBox(
                width: 400.0,
                height: 200.0,
                child: ListView(
                  children: <Widget>[
                    Title(
                        color: Colors.black,
                        child: Text('Ingredients',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0))),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: result == null ? 0 : result[4],
                    //   itemBuilder: (context, index) {
                    //     return;
                    //   },
                    // )
                  ],
                ),
              ),
              SizedBox(
                width: 400.0,
                height: 200.0,
                child: ListView(
                  children: <Widget>[
                    Title(
                      color: Colors.black,
                      child: Text(
                        'Steps',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      ),
                    ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: result == null ? 0 : result.asMap(),
                    //   itemBuilder: (context, index) {
                    //     return;
                    //   },
                    // )
                  ],
                ),
              ),
              SizedBox(
                  width: 400.0,
                  height: 200.0,
                  child: Column(children: <Widget>[
                    Text('Published by'),
                    Text(
                      result[0].author,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ]))
            ],
          ),
        ],
      ),
    );
  }
}
