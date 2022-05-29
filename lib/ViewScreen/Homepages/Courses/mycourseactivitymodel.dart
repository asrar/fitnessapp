class MyCourseActivityModel {
  MyCourseActivityModel({
    required this.message,
    required this.Data1,
  });
  late final String message;
  late final List<Data> Data1;

  MyCourseActivityModel.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.userId,
    required this.courseId,
    required this.week,
    required this.day,
    required this.detail,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int userId;
  late final int courseId;
  late final int week;
  late final int day;
  late final String detail;
  late final Null image;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    courseId = json['course_id'];
    week = json['week'];
    day = json['day'];
    detail = json['detail'];
    image = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['course_id'] = courseId;
    _data['week'] = week;
    _data['day'] = day;
    _data['detail'] = detail;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}