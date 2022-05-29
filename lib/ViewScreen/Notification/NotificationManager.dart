import 'dart:async';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/courseservice.dart';
import 'package:rxdart/rxdart.dart';

import 'NotificationModel.dart';
import 'NotificationService.dart';

class NotificationManager {
  final BehaviorSubject<List<NotificationModel>> _main =
  BehaviorSubject<List<NotificationModel>>();
  Stream<List<NotificationModel>> get mainList async* {
    yield await NotificationService.browse();
  }

  NotificationManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
