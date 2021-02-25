import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sdp_project/bloc/homerecipe/homerecipeBloc.dart';
import 'package:sdp_project/bloc/login/loginBloc.dart';

import '../../bloc/recipe/recipeBloc.dart';
import '../../bloc/recipe/recipeModel.dart';
import 'edit_recipe.dart';

class UserRecipePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserRecipePageState();
  }
}

class _UserRecipePageState extends State<UserRecipePage> {
  List<RecipeModel> data = [];

  Widget build(BuildContext context) {
    data = BlocProvider.of<RecipeBloc>(context).result;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<HomeRecipeBloc>(context).add(
              FetchHomeRecipeData(null),
            );
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: Text('Your Uploaded Recipes',
                  style: GoogleFonts.inter(
                      fontSize: 40, fontWeight: FontWeight.w500)),
            ),
          ),
          BlocBuilder<RecipeBloc, RecipeState>(
            builder: (context, state) {
              if (state is LoadingRecipe) {
                return LinearProgressIndicator();
              }
              if (state is RecipeLoaded) {
                return Recipe();
              }
              if (state is RecipeFailedLoad) {
                return Recipe();
              }
              return UserRecipePage();
            },
          ),
        ],
      ),
    );
  }
}

class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    List<RecipeModel> data = BlocProvider.of<RecipeBloc>(context).result;

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Container(
        decoration: BoxDecoration(color: Colors.white54),
        height: 580,
        child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RecipeList(data[index]);
            }),
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  final data;
  RecipeList(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.98,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                color: Colors.orange[300],
                elevation: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, top: 8.0, bottom: 8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.23,
                          maxHeight: MediaQuery.of(context).size.width * 0.28,
                        ),
                        child: CachedNetworkImage(
                          height: 210,
                          width: 200,
                          fit: BoxFit.fill,
                          imageUrl:
                              'https://czechoslovakian-scr.000webhostapp.com/uploads(Recipe)/${data.image}',
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                          fadeOutDuration: new Duration(seconds: 1),
                          fadeInDuration: new Duration(seconds: 3),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              data.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                            child: Text(
                              '  Category : ${data.category}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            var url =
                                'https://czechoslovakian-scr.000webhostapp.com/delete_recipe.php';

                            http.post(url, body: {'id': data.recipeid});
                            BlocProvider.of<RecipeBloc>(context).add(
                              FetchRecipeData(
                                  BlocProvider.of<LoginBloc>(context).userid),
                            );
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
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditRecipePage(data),
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
