import 'dart:async';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/courseservice.dart';
import 'package:rxdart/rxdart.dart';

import 'OnGoingCourse/myOngoingCoursesModel.dart';

class CourseManager {
  ///
  final BehaviorSubject<List<GetCoursesModel>> _main =
      BehaviorSubject<List<GetCoursesModel>>();

  Stream<List<GetCoursesModel>> get mainList async* {
    yield await CourseServices.browse();
  }


  CourseManager() {
    print("-- getting data from stream in mainList");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
