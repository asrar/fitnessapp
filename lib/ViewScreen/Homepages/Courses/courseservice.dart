import 'dart:async';
import 'dart:convert';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/AppLayer/Overseer.dart';

import 'OnGoingCourse/myOngoingCoursesModel.dart';

class CourseServices {
  static Future<List<GetCoursesModel>> browse() async {
    http.Response response;
    // Uri url = new Uri(host: "", path: "/fitness/public/api/courses");
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
    Overseer.printWrapped("this is the content of of the trainer ${content}");
    var jString = [content];

    String arr = jString.toString();
    List collection = json.decode(arr);
    print('print before parssing ');
    List<GetCoursesModel> _mainList =
        collection.map((json) => GetCoursesModel.fromJson(json)).toList();
    print('print after parssing ');
    // print("print image path ${_mainList[0].Data1[0].DayActivity1[0].image}");
    // print('day actvity lenth ${_mainList[0].Data1[0].DayActivity1[0].day}');
    print("model class lenth ${_mainList.length.toString()}");
    print("data of courses ${_mainList[0].Data1.length}");
    // print("print image path ${_mainList[0].Data1[0].DayActivity1[0].image}");
    print(' the trainer video ${_mainList[0].Data1[0].video}');
    print(' the trainer title ${_mainList[0].Data1[0].title}');
    print(' the courses lenth ${_mainList[0].Data1.length}');
    print(' the trainer response ${response.body}');
    print(' the trainer content ${content}');

    // if (_mainList[0].Data1[2].Trainer1 != null) {
    //   print("print if block in the course");
    //   // print('if block execute the error the trainer name ${_mainList[0].Data1[4].Trainer1!.firstName}');
    //   // print(' the trainer video ${_mainList[0].Data1[4].video}');
    //   // // print(' the trainer name ${_mainList[0].Data1[4].Equipments1[0].name}');
    //   // // print(' the trainer video ${_mainList[0].Data1[4].daystocompletion}');
    //   // print(' the trainer details ${_mainList[0].Data1[4].DayActivity1[0].detail}');
    // } else {
    //   print("after the course");
    //   print(
    //       'else block execute the error hee print the user id ${_mainList[0].Data1[0].title.toString()}');
    // }
    Overseer.MainvideoURL = _mainList[0].Data1[0].video;
    print("the total data in here ${_mainList[0].Data1}");

    //Todo error ki waja sy comment kar dia rat ko
    //Todo important code
    Overseer.allCategoryCoursesList.clear();
    Overseer.newCoursesList.clear();
    Overseer.trendingCoursesList.clear();
    Overseer.withToolsMCoursesList.clear();
    Overseer.withoughtToolsMCoursesList.clear();
    Overseer.gYMCoursesList.clear();
    for (int i = 0; i < _mainList[0].Data1.length; i++) {
      print("the total data in for loop ${_mainList[0].Data1.length}");
      // print("the dictionary data ${Overseer.categoryCoursesName.keys}");
      print(
          "the total catagry id  ${_mainList[0].Data1[i].CourseCategories1.catId}");
      print(
          "the total catagry courses id  ${Overseer.categoryCoursesName.keys}");
      print(
          "th if condition values ${Overseer.categoryCoursesName.keys.contains(_mainList[0].Data1[i].CourseCategories1.catId.toString())}");
      if (Overseer.categoryCoursesName.keys
          .contains(_mainList[0].Data1[i].CourseCategories1.catId.toString())) {
        print("1st if condition ");
        if (_mainList[0].Data1[i].CourseCategories1.catId.toString() == "1") {
          print("inside loop ");
          print("inside if ");
          // print("the total data id 1 ${_mainList[0].Data1[i].CourseCategories1.catId}");
          Overseer.newCoursesList.add(_mainList[0].Data1[i]);
        }
        if (_mainList[0].Data1[i].CourseCategories1.catId.toString() == "2") {
          print("inside loop ");
          // print("the total data ID 2 ${_mainList[0].Data1[i].CourseCategories1.catId}");
          Overseer.trendingCoursesList.add(_mainList[0].Data1[i]);
        }
        if (_mainList[0].Data1[i].CourseCategories1.catId.toString() == "3") {
          print("inside loop ");
          // print("the total data ID 3 ${_mainList[0].Data1[i].CourseCategories1.catId}");
          Overseer.withToolsMCoursesList.add(_mainList[0].Data1[i]);
        }
        if (_mainList[0].Data1[i].CourseCategories1.catId.toString() == "4") {
          print("inside loop ");
          // print("the total data ID 4 ${_mainList[0].Data1[i].CourseCategories1.catId}");
          print("inside loop ");
          Overseer.withoughtToolsMCoursesList.add(_mainList[0].Data1[i]);
          // Overseer.withoughtToolsMCoursesList.add(_mainList[0].Data1[i]);
          // print("inside if lenth ${_mainList[0].Data1[i]}");
        }
        if (_mainList[0].Data1[i].CourseCategories1.catId.toString() == "5") {
          print("inside loop ");
          // print("the total data ID 5 ${_mainList[0].Data1[i].CourseCategories1.catId}");
          Overseer.gYMCoursesList.add(_mainList[0].Data1[i]);
        }
        print("out side for loop");
      } else {
        print("out side for loop dasi dasi yama");
      }
    }
    // end for loop
    Overseer.allCategoryCoursesList.add(Overseer.newCoursesList.length);
    Overseer.allCategoryCoursesList.add(Overseer.trendingCoursesList.length);
    Overseer.allCategoryCoursesList.add(Overseer.withToolsMCoursesList.length);
    Overseer.allCategoryCoursesList
        .add(Overseer.withoughtToolsMCoursesList.length);
    Overseer.allCategoryCoursesList.add(Overseer.gYMCoursesList.length);
    print("out side for loop");
    print("all list length new ${Overseer.newCoursesList.length}");
    print("all list length trend ${Overseer.trendingCoursesList.length}");
    print("all list length with ${Overseer.withToolsMCoursesList.length}");
    print("all list length out ${Overseer.withoughtToolsMCoursesList.length}");
    print("all list length gym ${Overseer.gYMCoursesList.length}");
    print("out side for loop bla bla ${Overseer.allCategoryCoursesList}");
    return _mainList;
  }

}
