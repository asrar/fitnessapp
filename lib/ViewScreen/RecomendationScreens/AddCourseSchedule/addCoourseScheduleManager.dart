import 'dart:async';
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:rxdart/rxdart.dart';

import 'addCourseScheduleService.dart';
import 'addcoursesScheduleModel.dart';

class AddCoursesScheduleManager {
  final BehaviorSubject<List<AddCourseScheduleModel>> _main =
  BehaviorSubject<List<AddCourseScheduleModel>>();

  Stream<List<AddCourseScheduleModel>> get mainList async* {
    yield await AddCoursesScheduleService.browse(Overseer.scheduleQuery);

  }


  UpdateFitnessProfileManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
