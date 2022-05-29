import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'MyStatisticService.dart';
import 'statistic_Model.dart';

// class MyStatisticManager {
class MyStatisticManager {
  final BehaviorSubject<List<StatisticModel>> _main =
  BehaviorSubject<List<StatisticModel>>();
  Stream<List<StatisticModel>> get mainList async* {
    yield await MyStatisticService.browse();
  }

  MyStatisticManager() {
    print("-- getting data from stream statistic");
    mainList.listen((value) => _main.addStream(mainList));
  }
}