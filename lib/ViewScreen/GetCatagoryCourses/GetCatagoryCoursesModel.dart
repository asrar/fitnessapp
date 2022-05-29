class GetCatagoryCoursesModel {
  GetCatagoryCoursesModel({
    required this.message,
    required this.Data1,
  });
  late final String message;
  late final List<Data> Data1;

  GetCatagoryCoursesModel.fromJson(Map<String, dynamic> json){
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
    required this.title,
    required this.description,
    required this.video,
    required this.daystocompletion,
    required this.courseId,
    required this.catId,
    required this.Equipments1,
  });
  late final int id;
  late final String title;
  late final String description;
  late final String video;
  late final int daystocompletion;
  late final int courseId;
  late final int catId;
  late final List<Equipments> Equipments1;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    video = json['video'];
    daystocompletion = json['daystocompletion'];
    courseId = json['course_id'];
    catId = json['cat_id'];
    Equipments1 = List.from(json['Equipments']).map((e)=>Equipments.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['video'] = video;
    _data['daystocompletion'] = daystocompletion;
    _data['course_id'] = courseId;
    _data['cat_id'] = catId;
    _data['Equipments'] = Equipments1.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Equipments {
  Equipments({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Equipments.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}