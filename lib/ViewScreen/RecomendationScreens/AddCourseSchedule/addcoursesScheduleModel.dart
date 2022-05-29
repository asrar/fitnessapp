class AddCourseScheduleModel {
  AddCourseScheduleModel({
    required this.message,
    required this.Data,
  });
  late final String message;
  late final List<dynamic> Data;

  AddCourseScheduleModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    Data = List.castFrom<dynamic, dynamic>(json['Data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['Data'] = Data;
    return _data;
  }
}