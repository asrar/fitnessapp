import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/AppLayer/Overseer.dart';

import 'addcoursesScheduleModel.dart';

class AddCoursesScheduleService {
  static Future<List<AddCourseScheduleModel>> browse(String query) async {
    http.Response response;
    // Uri url = new Uri(host: "", path: "/fitness/public/api/courses");
    response = await http.post(
      /// get the data
      Uri.parse(
          "https://yfitness.com/fitness/public/api/makeCourseSchedule?user_id=${Overseer.userId}&${query}"),
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        'Authorization':
        'Bearer FegGc2loq2FoHcZdPJ2VhQA0jXJYihjBUGSs4rq0qyhNrb1xFabQMV6yFkrx',
      },
    );
    print(
        "print link course schedule ${"https://yfitness.com/fitness/public/api/makeCourseSchedule?user_id=${Overseer.userId}&${query}"}");
    print("got the response courses schedule ");
    String content = response.body;

    Overseer.printWrapped("got the response courses schedule data " + response.statusCode.toString());
    Overseer.printWrapped(content);
    var jString = [content];
    String arr = jString.toString();
    List collection = json.decode(arr);
    print("course schedule updated");
    if (response.statusCode == 200) {
      print("status code 200 print link course schedule ");
      Overseer.isOngoingSuccess = true;
    } else {
      Overseer.isOngoingSuccess = false;
    }
    print("course schedule updated service call start");
    List<AddCourseScheduleModel> _mainList = collection
        .map((json) => AddCourseScheduleModel.fromJson(json))
        .toList();
    print("course schedule updated service call end");
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
