import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'DictionaryModel.dart';

class DictionaryService {
  static Future<bool> browse() async {
    print("dictionary loading");
    http.Response response;

    response = await http.post(

      /// get the data
        Uri.parse("https://yfitness.com/fitness/public/api/dictionry"),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Authorization':
          'Bearer FegGc2loq2FoHcZdPJ2VhQA0jXJYihjBUGSs4rq0qyhNrb1xFabQMV6yFkrx',
        });

    print("got the response");
    String content = response.body;
    Overseer.printWrapped("got the response Dictionary data" + content);
    print("the user id in here ${Overseer.userId}");
    var jString = [content];
    if (response.statusCode == 200) {
      String arr = jString.toString();
      List collection = json.decode(arr);
      print("start the dictionary json sevice");
      List<DictionaryModel> dictionaryValues =
      collection.map((json) => DictionaryModel.fromJson(json)).toList();
      print("end the dictionary json sevice");
      print("video URL ${dictionaryValues[0].Data1.tutrialVideos[0].videoUrl}");
      print("Video Caption ${dictionaryValues[0].Data1.tutrialVideos[0]
          .caption}");
      Overseer.videoURL = dictionaryValues[0].Data1.tutrialVideos[0].videoUrl;
      Overseer.home_text = dictionaryValues[0].Data1.homeText[0];
      Overseer.home_text_2nd = dictionaryValues[0].Data1.homeText[1];
      Overseer.videoCaption =
          dictionaryValues[0].Data1.tutrialVideos[0].caption;
      //Todo: Free trial
      // Overseer.categoryCoursesName.putIfAbsent("id", () => dictionaryValues[0].Data1.coursesCategories[0].id.toString());
      // Overseer.categoryCoursesName.putIfAbsent("title", () => dictionaryValues[0].Data1.coursesCategories[0].title.toString());
      for (int i = 0; i <
          dictionaryValues[0].Data1.coursesCategories.length; i++) {
        /// title and ID
        Overseer.categoryCoursesName.putIfAbsent(
            "${dictionaryValues[0].Data1.coursesCategories[i].id.toString()}",
                () => dictionaryValues[0].Data1.coursesCategories[i].title);
        /// image
        Overseer.categoryCoursesimage.putIfAbsent(
            "${dictionaryValues[0].Data1.coursesCategories[i].id
                .toString()}", () =>
        dictionaryValues[0].Data1.coursesCategories[i].image);
        print("this value is catgroy ${dictionaryValues[0].Data1
            .coursesCategories[i].title}");
      }

      /// image
      for (int i = 0; i <
          dictionaryValues[0].Data1.coursesCategories.length; i++) {
        Overseer.categoryCoursesimage.putIfAbsent(
            "${dictionaryValues[0].Data1.coursesCategories[i].id
                .toString()}", () =>
        dictionaryValues[0].Data1.coursesCategories[i].image);
        print("this value is catgroy ${dictionaryValues[0].Data1
            .coursesCategories[i].title}");
      }


      Overseer.freePlan.putIfAbsent("id",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[0].id.toString());
      Overseer.freePlan.putIfAbsent(
          "title",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[0].title.toString());
      Overseer.freePlan.putIfAbsent(
          "per_month_fee",
              () =>
              dictionaryValues[0]
                  .Data1
                  .subscriptionsPlan[0]
                  .perMonthFee
                  .toString());
      Overseer.freePlan.putIfAbsent(
          "total_fee",
              () =>
              dictionaryValues[0]
                  .Data1
                  .subscriptionsPlan[0]
                  .totalFee
                  .toString());
      Overseer.freePlan.putIfAbsent(
          "status",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[0].status.toString());
//Todo monthly plan
      print(
          "monthly title  ${dictionaryValues[0].Data1.subscriptionsPlan[1]
              .totalFee.toString()}");
      Overseer.monthlyPlan.putIfAbsent("id",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[1].id.toString());
      Overseer.monthlyPlan.putIfAbsent(
          "title",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[1].title.toString());
      Overseer.monthlyPlan.putIfAbsent(
          "per_month_fee",
              () =>
              dictionaryValues[0]
                  .Data1
                  .subscriptionsPlan[1]
                  .perMonthFee
                  .toString());
      Overseer.monthlyPlan.putIfAbsent(
          "total_fee",
              () =>
              dictionaryValues[0]
                  .Data1
                  .subscriptionsPlan[1]
                  .totalFee
                  .toString());
      Overseer.monthlyPlan.putIfAbsent(
          "status",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[1].status.toString());
//Todo: yearly Plan
      print(
          "yearly title  ${dictionaryValues[0].Data1.subscriptionsPlan[2]
              .totalFee.toString()}");
      Overseer.yearlyPlan.putIfAbsent("id",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[2].id.toString());
      Overseer.yearlyPlan.putIfAbsent(
          "title",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[2].title.toString());
      Overseer.yearlyPlan.putIfAbsent(
          "per_month_fee",
              () =>
              dictionaryValues[0]
                  .Data1
                  .subscriptionsPlan[2]
                  .perMonthFee
                  .toString());
      Overseer.yearlyPlan.putIfAbsent(
          "total_fee",
              () =>
              dictionaryValues[0]
                  .Data1
                  .subscriptionsPlan[2]
                  .totalFee
                  .toString());
      Overseer.yearlyPlan.putIfAbsent(
          "status",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[2].status.toString());
//Todo: quartly Plan
      Overseer.quartlyPlan.putIfAbsent("id",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[3].id.toString());
      Overseer.quartlyPlan.putIfAbsent(
          "title",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[3].title.toString());
      Overseer.quartlyPlan.putIfAbsent(
          "per_month_fee",
              () =>
              dictionaryValues[0]
                  .Data1
                  .subscriptionsPlan[3]
                  .perMonthFee
                  .toString());
      Overseer.quartlyPlan.putIfAbsent(
          "total_fee",
              () =>
              dictionaryValues[0]
                  .Data1
                  .subscriptionsPlan[3]
                  .totalFee
                  .toString());

      Overseer.quartlyPlan.putIfAbsent(
          "status",
              () =>
              dictionaryValues[0].Data1.subscriptionsPlan[3].status.toString());
      //Todo: fitness goals id and name
      // print("this is sub plan mmmm ${dictionaryValues[0].Data1.subscriptionsPlan.toString}");
      for (int i = 0; i < dictionaryValues[0].Data1.fitnessGoals.length; i++) {
        Overseer.fitnessGoalMap.putIfAbsent(
            "${dictionaryValues[0].Data1.fitnessGoals[i].name}",
                () => dictionaryValues[0].Data1.fitnessGoals[i].id);
      }
      //Todo image path
      Overseer.course_image_path =
          dictionaryValues[0].Data1.coursesImgPath.toString();
      Overseer.user_image_path =
          dictionaryValues[0].Data1.usersImgPath.toString();
      Overseer.base_URL = dictionaryValues[0].Data1.baseUrl.toString();
      print("this is overseer image path ${Overseer.course_image_path}");
      print("this is overseer image path  ${Overseer.user_image_path}");

      return true;
    } else {
      return false;
    }
  }
}
