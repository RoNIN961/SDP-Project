import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/bloc/custotal/custotalBloc.dart';

import '../bloc/homerecipe/homerecipeBloc.dart';
import '../bloc/homerestaurant/homerestaurantBloc.dart';
import '../bloc/ingredient/ingredientBloc.dart';
import '../bloc/instruction/instructionBloc.dart';
import '../bloc/login/loginBloc.dart';
import '../bloc/recipe/recipeBloc.dart';

class CustomLogo extends StatelessWidget {
  CustomLogo({@required this.onPressed, this.image});
  final GestureTapCallback onPressed;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Hero(
              tag: 'hero', child: CircleAvatar(radius: 80.0, child: image))),
      onPressed: onPressed,
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({@required this.text, this.controller});
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: text,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0))),
        ),
      ),
    );
  }
}

class CustomHiddenTextField extends StatelessWidget {
  CustomHiddenTextField({@required this.text, this.controller});
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              hintText: text,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0))),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  CustomButton1({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: ButtonTheme(
          height: 56,
          child: RaisedButton(
            child:
                Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
            color: Colors.black87,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: onPressed,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class CustomButton2 extends StatelessWidget {
  CustomButton2({@required this.onPressed, this.text, this.color});
  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: FlatButton(
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 16),
          ),
          onPressed: onPressed),
      onPressed: onPressed,
    );
  }
}

class CustomButton3 extends StatelessWidget {
  CustomButton3({@required this.onPressed, this.text});
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.pink, Colors.redAccent]),
              borderRadius: BorderRadius.circular(80.0),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 100.0,
                maxHeight: 40.0,
              ),
              alignment: Alignment.center,
              child: Text(
                (text),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final _menutextcolor = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
  final _iconcolor = new IconThemeData(
    color: Color(0xff757575),
  );
  @override
  Widget build(BuildContext context) {
    String username = BlocProvider.of<LoginBloc>(context).name;
    String useremail = BlocProvider.of<LoginBloc>(context).email;
    String userid = BlocProvider.of<LoginBloc>(context).userid;

    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text(username),
          accountName: Text(useremail),
          currentAccountPicture: Image.asset('assets/personicon.jpg'),
        ),
        ListTile(
          trailing: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.list),
          ),
          title: Text("My recipes", style: _menutextcolor),
          selected: true,
          onTap: () {
            BlocProvider.of<RecipeBloc>(context).add(
              FetchRecipeData(userid),
            );
            BlocProvider.of<IngredientBloc>(context).add(
              ResetIngredientData(),
            );
            BlocProvider.of<InstructionBloc>(context).add(
              ResetInstructionData(),
            );
            Navigator.pushNamed(context, '/user_recipes');
          },
        ),
        ListTile(
          trailing: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.account_box),
          ),
          title: Text("Account", style: _menutextcolor),
          onTap: () {
            BlocProvider.of<CusTotalBloc>(context)
                .add(FetchCusTotalData(userid));
            Navigator.pushNamed(context, '/profile');
          },
        ),
        ListTile(
          trailing: IconTheme(
            data: _iconcolor,
            child: Icon(Icons.logout),
          ),
          title: Text("Logout", style: _menutextcolor),
          onTap: () {
            BlocProvider.of<LoginBloc>(context).add(ResetLoginData());
            BlocProvider.of<HomeRestaurantBloc>(context)
                .add(ResetHomeRestaurantData());
            BlocProvider.of<HomeRecipeBloc>(context).add(ResetHomeRecipeData());
            BlocProvider.of<RecipeBloc>(context).add(ResetRecipeData());
            BlocProvider.of<IngredientBloc>(context).add(
              ResetIngredientData(),
            );
            BlocProvider.of<InstructionBloc>(context).add(
              ResetInstructionData(),
            );
            Navigator.pushNamed(context, '/');
          },
        ),
      ],
    );
  }
}
