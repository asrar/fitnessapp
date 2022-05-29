import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'TrialService.dart';

class TrialManager {
  final BehaviorSubject<bool> _main =
  BehaviorSubject<bool>();
  Stream<bool> get mainList async* {
    yield await TrialServices.browse();
  }

  TrialManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
