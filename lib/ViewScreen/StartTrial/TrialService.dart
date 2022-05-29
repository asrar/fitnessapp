import 'dart:async';
import 'dart:convert';
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/ViewScreen/StartTrial/StartTrialModel.dart';
import 'package:http/http.dart' as http;

class TrialServices {
  static Future<bool> browse() async {
    http.Response response;
    response = await http.post(

        /// get the data
        Uri.parse(
            "https://yfitness.com/fitness/public/api/startTrial?user_id=${Overseer.userId}"),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Authorization':
              'Bearer FegGc2loq2FoHcZdPJ2VhQA0jXJYihjBUGSs4rq0qyhNrb1xFabQMV6yFkrx',
        });
    //,headers: {
    //       'Access-Control-Allow-Origin': '*',
    //       'Accept' : 'application/json',
    //       'Authorization':'Bearer ${Overseer.token}',
    //
    //     }
    print("got the response");
    String content = response.body;
    //  Overseer.printWrapped(content);
    var jString = [content];
    if (response.statusCode == 200) {
      Overseer.freeTrialEnable = true;
      Overseer.freeTrialMessage = "Your free trial has been started";
      return true;
    }
    else {
      Overseer.freeTrialEnable = false;
      Overseer.freeTrialMessage = "Sorry your free trial cant be started";
      return false;
    }

    // String arr = jString.toString();
    // List collection = json.decode(arr);
    //
    // List<StartTrialModel> _mainList =
    // collection.map((json) => StartTrialModel.fromJson(json)).toList();
    // // print(_mainList[0].Data[0].title);
    // // Overseer.MainvideoURL = _mainList[0].Data[0].video;

    // return true;
  }
}
