import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'GetCatagoryCoursesModel.dart';
import 'GetCatagoryCoursesService.dart';

class GetCatogeryCoursesManager {
  final BehaviorSubject<List<GetCatagoryCoursesModel>> _main =
  BehaviorSubject<List<GetCatagoryCoursesModel>>();
  Stream<List<GetCatagoryCoursesModel>> get mainList async* {
    yield await GetCatagoryCoursesService.browse();
  }

  GetCatogeryCoursesManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
