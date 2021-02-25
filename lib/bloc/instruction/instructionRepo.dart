import 'dart:convert';

import 'package:http/http.dart' as http;

import 'instructionModel.dart';

class InstructionRepo {
  Future<List<InstructionModel>> getData(String recipeid) async {
    final result = await http.post(
      "https://czechoslovakian-scr.000webhostapp.com/fetch_instruction_based_on_recipe.php",
      body: {'Recipe_ID': recipeid},
    );

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<InstructionModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonInstruction = jsonDecoded['data'];
    List<InstructionModel> datalist = [];

    for (int i = 0; i < jsonInstruction.length; i++) {
      datalist.add(
        InstructionModel.fromJson(jsonInstruction[i]),
      );
    }
    return datalist;
  }
}
