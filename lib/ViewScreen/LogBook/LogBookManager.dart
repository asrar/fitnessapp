import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'LogBookService.dart';
import 'LogBookModel.dart';

class LogBookManager {
  final BehaviorSubject<List<LogBookModel>> _main =
  BehaviorSubject<List<LogBookModel>>();
  Stream<List<LogBookModel>> get mainList async* {
    yield await LogBookService.browse();
  }

  LogBookManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
