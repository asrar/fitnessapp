class BookModelList {
  BookModelList({
    required this.message,
    required this.Data1,
  });
  late final String message;
  late final List<Data> Data1;

  BookModelList.fromJson(Map<String, dynamic> json){
    message = json['message'];
    Data1 = List.from(json['Data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['Data'] = Data1.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.activity,
    this.courseId,
    this.notificationId,
    this.subscriptionId,
  });
  late final String activity;
  late final String? courseId;
  late final String? notificationId;
  late final String? subscriptionId;

  Data.fromJson(Map<String, dynamic> json){
    activity = json['activity'];
    courseId = null;
    notificationId = null;
    subscriptionId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['activity'] = activity;
    _data['course_id'] = courseId;
    _data['notification_id'] = notificationId;
    _data['subscription_id'] = subscriptionId;
    return _data;
  }
}