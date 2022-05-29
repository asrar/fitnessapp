import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/AppLayer/Overseer.dart';

import 'UpdateFitnessProfileModel.dart';

class UpdateFitnessProfileService {
  static Future<List<UpdateFitenessProfileModel>> browse(String query) async {
    http.Response response;
    // Uri url = new Uri(host: "", path: "/fitness/public/api/courses");
    response = await http.post(
      /// get the data
      Uri.parse(
          "https://yfitness.com/fitness/public/api/updateFitnessProfile/${Overseer.userId}?${query}"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        'Authorization':
            'Bearer FegGc2loq2FoHcZdPJ2VhQA0jXJYihjBUGSs4rq0qyhNrb1xFabQMV6yFkrx',
      },
    );
    print(
        "print link fitnessupate ${"https://yfitness.com/fitness/public/api/updateFitnessProfile/${Overseer.userId}?${query}"}");
    print("got the response");
    String content = response.body;
    Overseer.printWrapped("got the response FitnessProfile data" + content);
     Overseer.printWrapped(content);
    var jString = [content];
    String arr = jString.toString();
    List collection = json.decode(arr);
    print("fitness updated");
    if (response.statusCode == 200) {
      print("status code 200");
      Overseer.is_Profile_updated = true;
    } else {
      Overseer.is_Profile_updated = false;
    }
    print("profile updated service call start");
    List<UpdateFitenessProfileModel> _mainList = collection
        .map((json) => UpdateFitenessProfileModel.fromJson(json))
        .toList();
    print("profile updated service call end");
    // print("this is the user fitnes goal id "+"${Overseer.fitnesgoal_id}");

    // Overseer.gender = _mainList[0].Data1.gender.toString();
    // Overseer.height = _mainList[0].Data1.FitnessIngrediants1.height.toString();
    // Overseer.weight = _mainList[0].Data1.FitnessIngrediants1.weight.toString();
    // Overseer.fitnesgoal_id = _mainList[0].Data1.FitnessIngrediants1.fitnessGoalId.toString();
    // Overseer.date_of_birth = _mainList[0].Data1.dob.toString();
    // print("Update Fitness Profile ${_mainList}");

    return _mainList;
  }
}
