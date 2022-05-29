import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'ongoingcourseservice.dart';
import 'myOngoingCoursesModel.dart';

class OnGoingCourseManager {
  ///
  final BehaviorSubject<List<MyOngoingCoursesModel>> _main =
      BehaviorSubject<List<MyOngoingCoursesModel>>();

  Stream<List<MyOngoingCoursesModel>> get mainList async* {
    yield await OnGoingCourseServices.browse();
  }


  OnGoingCourseManager() {
    print("-- getting data from stream in mainList");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
