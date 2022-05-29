import 'dart:async';
import 'dart:convert';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/AppLayer/Overseer.dart';

import 'ProfileModel.dart';

class ProfileService {
  static Future<List<ProfileModel>> browse() async {
    print("https://yfitness.com/fitness/public/api/updateProfile/${Overseer.userId}");
    http.Response response;
    Uri url = new Uri(host: "", path: "/fitness/public/api/courses");
    response = await http.post(
      /// get the data
        Uri.parse("https://yfitness.com/fitness/public/api/updateProfile/${Overseer.userId}"),
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
     Overseer.printWrapped("Profile Data : "+content);
    var jString = [content];

    String arr = jString.toString();
    List collection = json.decode(arr);

    List<ProfileModel> _mainList =
    collection.map((json) => ProfileModel.fromJson(json)).toList();
    print(_mainList[0].Data1);

    return _mainList;
  }
}


