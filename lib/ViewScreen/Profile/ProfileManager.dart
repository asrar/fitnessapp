import 'dart:async';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/courseservice.dart';
import 'package:fitnessapp/ViewScreen/Profile/ProfileService.dart';
import 'package:rxdart/rxdart.dart';

import 'ProfileModel.dart';

class ProfileManager {
  final BehaviorSubject<List<ProfileModel>> _main =
  BehaviorSubject<List<ProfileModel>>();
  Stream<List<ProfileModel>> get mainList async* {
    yield await ProfileService.browse();
  }

  ProfileManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
