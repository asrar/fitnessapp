import 'dart:async';
import 'dart:convert';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Notification/NotificationModel.dart';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/AppLayer/Overseer.dart';

import 'MySubscriptionModel.dart';

class MySubscriptionService {
  static Future<List<MySubscriptionModel>> browse() async {
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

    List<MySubscriptionModel> _mainList =
    collection.map((json) => MySubscriptionModel.fromJson(json)).toList();
    print(_mainList[0].Data1);

    return _mainList;
  }
}


