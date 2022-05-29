import 'dart:async';
import 'dart:convert';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'myOngoingCoursesModel.dart';

class OnGoingCourseServices {
  static Future<List<MyOngoingCoursesModel>> browse() async {
    http.Response response;
    // Uri url = new Uri(host: "", path: "/fitness/public/api/courses");
    response = await http.post(

        /// get the data
        Uri.parse("https://yfitness.com/fitness/public/api/myongoingcourses?user_id=${Overseer.userId}"),
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
    Overseer.printWrapped("this is the content of ongoing manager ${content}");
    var jString = [content];

    String arr = jString.toString();
    List collection = json.decode(arr);
    print('print before parssing ongoing manager');
    List<MyOngoingCoursesModel> _mainList =
        collection.map((json) => MyOngoingCoursesModel.fromJson(json)).toList();
    Overseer.onGoingCoursesLength =_mainList[0].Data1.length;
    print("on going courses length in here ${Overseer.onGoingCoursesLength}");
    print("on going courses length in here ${_mainList[0].Data1.length}");

    return _mainList;
  }

}
