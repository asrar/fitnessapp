import 'dart:async';
import 'dart:convert';
import 'package:fitnessapp/ViewScreen/LogOut/LogOutModel.dart';
import 'package:http/http.dart' as http;


class LogOutService {
  static Future<List<LogOutModel>> browse() async {
    http.Response response;
    Uri url = new Uri(host: "", path: "/fitness/public/api/courses");
    response = await http.post(
      /// get the data
        Uri.parse("http://yfitness.com/fitness/public/api/courses"),
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

    String arr = jString.toString();
    List collection = json.decode(arr);

    List<LogOutModel> _mainList =
    collection.map((json) => LogOutModel.fromJson(json)).toList();
    // print(_mainList[0].Data[0]);

    return _mainList;
  }
}


