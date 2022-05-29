import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'MySubscriptionModel.dart';
import 'MySubscriptionService.dart';

class MySubscriptionManager {
  final BehaviorSubject<List<MySubscriptionModel>> _main =
  BehaviorSubject<List<MySubscriptionModel>>();
  Stream<List<MySubscriptionModel>> get mainList async* {
    yield await MySubscriptionService.browse();
  }

  MySubscriptionManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
