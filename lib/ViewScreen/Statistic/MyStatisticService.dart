import 'dart:async';
import 'dart:convert';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Notification/NotificationModel.dart';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/AppLayer/Overseer.dart';

import 'statistic_Model.dart';


// class MyStatisticService {

class MyStatisticService {
  static Future<List<StatisticModel>> browse() async {
    http.Response response;
    // Uri url = new Uri(host: "", path: "/fitness/public/api/courses");
    response = await http.post(

      /// get the data
        Uri.parse("https://yfitness.com/fitness/public/api/myStatisticsSettings/8?distance_covered=40&calaries_gain=240&time_spand=2:15:15&record_date=2021-11-18"),
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
    print("print after parssing statistic");
    String content = response.body;
    Overseer.printWrapped("this is the content of of the trainer ${content}");
    var jString = [content];

    String arr = jString.toString();
    List collection = json.decode(arr);
    // print('print after parssing statistic');
    List<StatisticModel> _mainList =
    collection.map((json) => StatisticModel.fromJson(json)).toList();
    // print('print after parssing statistic');
    // Overseer.printWrapped("this is my response body${response.body}");

    // print("model class lenth ${_mainList.length.toString()}");
    // print(_mainList[0].Data1[0].title);
    // print("print image path ${_mainList[0].Data1[0].image}");
    // if (_mainList[0].Data1[0].Trainer1 != null) {
    //   print("orint if block in the course");
    //   print('if block execute the error the trainer name ${_mainList[0].Data1[4].Trainer1!.firstName}');
    //   // print(' the trainer video ${_mainList[0].Data1[4].video}');
    // }else {
    //   print("after the course");
    //   print('else block execute the error hee print the user id ${_mainList[0].Data1[0].title.toString()}');
    // }
    // Overseer.MainvideoURL = _mainList[0].Data1[0].video;

    return _mainList;
  }
}
