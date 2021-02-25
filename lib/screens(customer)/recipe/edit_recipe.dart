import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sdp_project/bloc/recipe/recipeBloc.dart';

import '../../bloc/ingredient/ingredientBloc.dart';
import '../../bloc/ingredient/ingredientModel.dart';
import '../../bloc/instruction/instructionBloc.dart';
import '../../bloc/instruction/instructionModel.dart';
import '../../bloc/login/loginBloc.dart';
import '../../theme/custom.dart';

class EditRecipePage extends StatefulWidget {
  final recipedata;
  EditRecipePage(this.recipedata);
  @override
  _EditRecipePageState createState() => _EditRecipePageState(recipedata);
}

class _EditRecipePageState extends State<EditRecipePage> {
  final recipedata;
  _EditRecipePageState(this.recipedata);

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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<RecipeBloc>(context).add(
              FetchRecipeData(BlocProvider.of<LoginBloc>(context).userid),
            );
            Navigator.pop(context);
          },
        ),
      ),
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
  File _image;
  // ignore: unused_field
  dynamic _pickImageError;
  final titleController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  final recipedata;
  _EditRecipeDetailState(this.recipedata);

  String title = 'DropDownButton';
  String _categorylist;
  List _categoryname = ['Halal', 'Non-Halal'];

  Future editRecipe(File imageFile) async {
    try {
      String title = titleController.text;

      var url = Uri.parse(
          'https://czechoslovakian-scr.000webhostapp.com/edit_recipe.php');

      var request = http.MultipartRequest("POST", url);

      request.fields['name'] = "";

      var pic = await http.MultipartFile.fromPath("image", imageFile.path);

      String image = pic.filename;

      String userid = BlocProvider.of<LoginBloc>(context).userid;

      request.files.add(pic);
      var uploadresponse = await request.send();

      if (uploadresponse.statusCode == 200) {
        print("image uploaded");
      } else {
        print("uploaded failed");
      }

      var data = {
        'recipeid': recipedata.recipeid,
        'title': title,
        'category': _categorylist,
        'image': image,
        'userid': userid,
        'name': "",
        'detail': convertStep(),
        'ingredient': convertIngredient(),
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message.contains('Successfully Updated!')) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Updated New Recipe!'),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Showing Alert Dialog with Response JSON Message.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(message),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String convertStep() {
    String steparray = '';
    for (int i = 0; i < instructiondata.length; i++) {
      steparray +=
          instruction[i] + (i == instructiondata.length - 1 ? '' : ',');
    }
    print(steparray);
    return steparray;
  }

  String convertIngredient() {
    String ingredientarray = '';
    for (int i = 0; i < ingredientdata.length; i++) {
      ingredientarray +=
          ingredient[i] + (i == ingredientdata.length - 1 ? '' : ',');
    }
    print(ingredientarray);
    return ingredientarray;
  }

  _imgFromCamera() async {
    try {
      final pickedFile = await _picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      setState(() {
        _image = File(pickedFile.path);
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(e);
    }
  }

  _imgFromGallery() async {
    try {
      final pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      setState(() {
        _image = File(pickedFile.path);
      });
      print(_image.path);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(e);
    }
  }

  List<String> ingredient = [];
  List<String> instruction = [];

  List<InstructionModel> instructiondata = [];

  List<IngredientModel> ingredientdata = [];

  List<TextEditingController> ingredientcontroller = [];

  List<TextEditingController> instructioncontroller = [];

  void addIngredientToList() {
    for (int i = 0; i < ingredientdata.length; i++) {
      ingredient.add(ingredientcontroller[i].text);
    }
  }

  void addStepToList() {
    for (int i = 0; i < instructiondata.length; i++) {
      instruction.add(instructioncontroller[i].text);
    }
  }

  @override
  Widget build(BuildContext context) {
    ingredientdata = BlocProvider.of<IngredientBloc>(context).result;
    instructiondata = BlocProvider.of<InstructionBloc>(context).result;

    Widget inputCategory() {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          width: 180,
          padding: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: DropdownButton(
            hint: Text(recipedata.category),
            dropdownColor: Colors.grey,
            elevation: 5,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 48,
            isExpanded: true,
            value: _categorylist,
            style: TextStyle(color: Colors.black, fontSize: 17),
            onChanged: (value) {
              setState(() {
                _categorylist = value;
              });
            },
            items: _categoryname.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    }

    return Scaffold(
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              child: SizedBox(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Color(0xffFDCF09),
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(_image.path),
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              height: 120,
                              width: 120,
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
            ),
            Container(
                child: Column(children: <Widget>[
              SizedBox(height: 30),
              CustomTextField(
                  text: recipedata.title, controller: titleController),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    inputCategory(),
                  ]),
              SizedBox(
                height: 30,
              ),
            ])),
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
                SizedBox(width: 190),
              ],
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: instructiondata == null ? 0 : instructiondata.length,
                itemBuilder: (context, index) {
                  for (int i = 0; i < instructiondata.length; i++) {
                    instructioncontroller.add(new TextEditingController());
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: instructioncontroller[index],
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
            CustomButton1(
              text: 'Update Recipe',
              onPressed: () {
                addIngredientToList();
                addStepToList();
                editRecipe(_image);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
