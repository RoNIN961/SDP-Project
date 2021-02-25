import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/ingredient/ingredientBloc.dart';
import '../../bloc/ingredient/ingredientModel.dart';
import '../../bloc/instruction/instructionBloc.dart';
import '../../bloc/instruction/instructionModel.dart';

class RecipeInfoPage extends StatefulWidget {
  final recipedata;
  RecipeInfoPage(this.recipedata);
  @override
  _RecipeInfoPageState createState() => _RecipeInfoPageState(recipedata);
}

class _RecipeInfoPageState extends State<RecipeInfoPage> {
  final recipedata;
  _RecipeInfoPageState(this.recipedata);

  @override
  void initState() {
    BlocProvider.of<IngredientBloc>(context).add(
      FetchIngredientData(recipedata.recipeid),
    );
    BlocProvider.of<InstructionBloc>(context)
        .add(FetchInstructionData(recipedata.recipeid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<IngredientBloc, IngredientState>(
          builder: (context, state) {
            if (state is LoadingIngredient) {
              return LinearProgressIndicator();
            }
            if (state is IngredientLoaded) {
              return BlocBuilder<InstructionBloc, InstructionState>(
                builder: (context, state) {
                  if (state is LoadingInstruction) {
                    return LinearProgressIndicator();
                  }
                  if (state is InstructionLoaded) {
                    return EditRecipeDetail(recipedata);
                  }
                  if (state is InstructionFailedLoad) {
                    return Center(
                      child: Container(
                        child: Text('Failed To Load!'),
                      ),
                    );
                  }
                  return EditRecipeDetail(recipedata);
                },
              );
            }
            if (state is IngredientFailedLoad) {
              return Center(
                child: Container(
                  child: Text('Failed To Load!'),
                ),
              );
            }
            return EditRecipeDetail(recipedata);
          },
        ),
      ),
    );
  }
}

class EditRecipeDetail extends StatefulWidget {
  final recipedata;
  EditRecipeDetail(this.recipedata);

  _EditRecipeDetailState createState() => _EditRecipeDetailState(recipedata);
}

class _EditRecipeDetailState extends State<EditRecipeDetail> {
  final recipedata;
  _EditRecipeDetailState(this.recipedata);

  List<String> ingredient = [];
  List<String> instruction = [];

  List<InstructionModel> instructiondata = [];

  List<IngredientModel> ingredientdata = [];

  List<TextEditingController> ingredientcontroller = [];

  List<TextEditingController> stepcontroller = [];

  void addIngredientToList(index) {
    setState(() {
      ingredientcontroller.add(ingredientcontroller[index]);
      ingredient.add(ingredientcontroller[index].text);
    });
  }

  void addInstructionToList(index) {
    setState(() {
      stepcontroller.add(stepcontroller[index]);
      instruction.add(stepcontroller[index].text);
    });
  }

  @override
  Widget build(BuildContext context) {
    ingredientdata = BlocProvider.of<IngredientBloc>(context).result;
    instructiondata = BlocProvider.of<InstructionBloc>(context).result;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
                child: Column(children: <Widget>[
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Text(recipedata.title,
                    style: GoogleFonts.inter(
                        fontSize: 40, fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
              ),
            ])),
            Container(
              child: SizedBox(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xffFDCF09),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      height: 140,
                      width: 140,
                      fit: BoxFit.fill,
                      imageUrl:
                          'https://czechoslovakian-scr.000webhostapp.com/uploads(Recipe)/${recipedata.image}',
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                      fadeOutDuration: new Duration(seconds: 1),
                      fadeInDuration: new Duration(seconds: 3),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                  color: Colors.black,
                  child: Text(
                    'Ingredients',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ingredientdata == null ? 0 : ingredientdata.length,
                itemBuilder: (context, index) {
                  for (int i = 0; i < ingredientdata.length; i++) {
                    ingredientcontroller.add(new TextEditingController());
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: ingredientcontroller[index],
                        decoration: InputDecoration(
                            hintText: ingredientdata[index].ingredient),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                  color: Colors.black,
                  child: Text(
                    'Steps',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: instructiondata == null ? 0 : instructiondata.length,
                itemBuilder: (context, index) {
                  for (int i = 0; i < instructiondata.length; i++) {
                    stepcontroller.add(new TextEditingController());
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: stepcontroller[index],
                        decoration: InputDecoration(
                            hintText: instructiondata[index].detail),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
