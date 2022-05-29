import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'LogOutModel.dart';
import 'LogOutService.dart';

class LogOutManager {
  final BehaviorSubject<List<LogOutModel>> _main =
  BehaviorSubject<List<LogOutModel>>();
  Stream<List<LogOutModel>> get mainList async* {
    yield await LogOutService.browse();
  }

  LogOutManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
