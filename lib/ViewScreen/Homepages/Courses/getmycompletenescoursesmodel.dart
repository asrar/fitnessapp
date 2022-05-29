class MyCompletenessCoursesModel {
  MyCompletenessCoursesModel({
    required this.message,
    required this.Data1,
  });
  late final String message;
  late final List<Data> Data1;

  MyCompletenessCoursesModel.fromJson(Map<String, dynamic> json){
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
    this.trainerId,
    required this.title,
    required this.description,
    required this.video,
    required this.image,
    required this.daystocompletion,
    required this.totalWeeks,
    required this.weekADays,
    required this.status,
    required this.sun,
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
    required this.Equipments1,
    required this.Trainer,
    required this.DayActivity,
    required this.CourseCategories1,
  });
  late final int id;
  late final Null trainerId;
  late final String title;
  late final String description;
  late final String video;
  late final String image;
  late final int daystocompletion;
  late final String totalWeeks;
  late final String weekADays;
  late final int status;
  late final int sun;
  late final int mon;
  late final int tue;
  late final int wed;
  late final int thu;
  late final int fri;
  late final int sat;
  late final List<Equipments> Equipments1;
  late final Null Trainer;
  late final List<dynamic> DayActivity;
  late final CourseCategories CourseCategories1;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    trainerId = null;
    title = json['title'];
    description = json['description'];
    video = json['video'];
    image = json['image'];
    daystocompletion = json['daystocompletion'];
    totalWeeks = json['total_weeks'];
    weekADays = json['week_a_days'];
    status = json['status'];
    sun = json['sun'];
    mon = json['mon'];
    tue = json['tue'];
    wed = json['wed'];
    thu = json['thu'];
    fri = json['fri'];
    sat = json['sat'];
    Equipments1 = List.from(json['Equipments']).map((e)=>Equipments.fromJson(e)).toList();
    Trainer = null;
    DayActivity = List.castFrom<dynamic, dynamic>(json['DayActivity']);
    CourseCategories1 = CourseCategories.fromJson(json['CourseCategories']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['trainer_id'] = trainerId;
    _data['title'] = title;
    _data['description'] = description;
    _data['video'] = video;
    _data['image'] = image;
    _data['daystocompletion'] = daystocompletion;
    _data['total_weeks'] = totalWeeks;
    _data['week_a_days'] = weekADays;
    _data['status'] = status;
    _data['sun'] = sun;
    _data['mon'] = mon;
    _data['tue'] = tue;
    _data['wed'] = wed;
    _data['thu'] = thu;
    _data['fri'] = fri;
    _data['sat'] = sat;
    _data['Equipments'] = Equipments1.map((e)=>e.toJson()).toList();
    _data['Trainer'] = Trainer;
    _data['DayActivity'] = DayActivity;
    _data['CourseCategories'] = CourseCategories1.toJson();
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

class CourseCategories {
  CourseCategories({
    required this.id,
    required this.title,
    required this.status,
    required this.courseId,
    required this.catId,
  });
  late final int id;
  late final String title;
  late final int status;
  late final int courseId;
  late final int catId;

  CourseCategories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    status = json['status'];
    courseId = json['course_id'];
    catId = json['cat_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['status'] = status;
    _data['course_id'] = courseId;
    _data['cat_id'] = catId;
    return _data;
  }
}