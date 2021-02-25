import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdp_project/bloc/ingredient/ingredientBloc.dart';
import 'package:sdp_project/bloc/instruction/instructionBloc.dart';
import 'package:sdp_project/screens(customer)/recipe/recipe_info.dart';

import '../../bloc/homerecipe/homerecipeBloc.dart';
import '../../bloc/homerecipe/homerecipeModel.dart';
import '../homescreen/home.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List<HomeRecipeModel> recipedata = [];

  @override
  Widget build(BuildContext context) {
    recipedata = BlocProvider.of<HomeRecipeBloc>(context).result;

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        BlocBuilder<HomeRecipeBloc, HomeRecipeState>(
          builder: (context, state) {
            if (state is LoadingHomeRecipeData) {
              return LinearProgressIndicator();
            }
            if (state is HomeRecipeDataLoaded) {
              return Recipe();
            }
            if (state is HomeRecipeFailedLoad) {
              return Center(
                child: Text(
                  'Failed To Load',
                  style: GoogleFonts.inter(fontSize: 30),
                ),
              );
            }
            return HomePage();
          },
        ),
      ],
    );
  }
}

class Recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HomeRecipeModel> recipedata =
        BlocProvider.of<HomeRecipeBloc>(context).result;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Container(
                child: SizedBox(
                  child: Text(
                    "Recipes",
                    style: GoogleFonts.inter(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: recipedata == null ? 0 : recipedata.length,
              itemBuilder: (context, index) {
                return RecipeList(
                  recipedata[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  final recipedata;
  RecipeList(this.recipedata);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 100.0, maxHeight: 100.0),
                child: CachedNetworkImage(
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://czechoslovakian-scr.000webhostapp.com/uploads(Recipe)/${recipedata.image}',
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  fadeOutDuration: new Duration(seconds: 1),
                  fadeInDuration: new Duration(seconds: 3),
                ),
              ),
              title: Text(
                recipedata.title == null ? 0 : recipedata.title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              contentPadding: null,
              subtitle: Text(
                recipedata.username == null ? 0 : recipedata.username,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('View'),
                  onPressed: () {
                    BlocProvider.of<InstructionBloc>(context)
                        .add(FetchInstructionData(recipedata.recipeid));
                    BlocProvider.of<IngredientBloc>(context)
                        .add(FetchIngredientData(recipedata.recipeid));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RecipeInfoPage(recipedata),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
