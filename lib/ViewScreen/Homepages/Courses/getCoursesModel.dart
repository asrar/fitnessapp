class GetCoursesModel {
  GetCoursesModel({
    required this.message,
    required this.Data1,
  });
  late final String message;
  late final List<Data> Data1;

  GetCoursesModel.fromJson(Map<String, dynamic> json){
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
    required this.Equipments1,
    this.Trainer1,
    required this.DayActivity1,
    required this.CourseCategories1,
  });
  late final int id;
  late final int? trainerId;
  late final String title;
  late final String description;
  late final String video;
  late final String image;
  late final int daystocompletion;
  late final String totalWeeks;
  late final String weekADays;
  late final int status;
  late final List<Equipments> Equipments1;
  late final Trainer? Trainer1;
  late final List<DayActivity> DayActivity1;
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
    Equipments1 = List.from(json['Equipments']).map((e)=>Equipments.fromJson(e)).toList();
    Trainer1 = null;
    DayActivity1 = List.from(json['DayActivity']).map((e)=>DayActivity.fromJson(e)).toList();
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
    _data['Equipments'] = Equipments1.map((e)=>e.toJson()).toList();
    _data['Trainer'] = Trainer;
    _data['DayActivity'] = DayActivity1.map((e)=>e.toJson()).toList();
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

class Trainer {
  Trainer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.FitnessIngrediants,
    this.SubscriptionPlan,
    required this.MySubscriptionpayments,
    this.MyNotifications,
    required this.MyStatistics,
    required this.MySettings,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final Null FitnessIngrediants;
  late final Null SubscriptionPlan;
  late final List<dynamic> MySubscriptionpayments;
  late final Null MyNotifications;
  late final List<dynamic> MyStatistics;
  late final List<dynamic> MySettings;

  Trainer.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    FitnessIngrediants = null;
    SubscriptionPlan = null;
    MySubscriptionpayments = List.castFrom<dynamic, dynamic>(json['MySubscriptionpayments']);
    MyNotifications = null;
    MyStatistics = List.castFrom<dynamic, dynamic>(json['MyStatistics']);
    MySettings = List.castFrom<dynamic, dynamic>(json['MySettings']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['FitnessIngrediants'] = FitnessIngrediants;
    _data['SubscriptionPlan'] = SubscriptionPlan;
    _data['MySubscriptionpayments'] = MySubscriptionpayments;
    _data['MyNotifications'] = MyNotifications;
    _data['MyStatistics'] = MyStatistics;
    _data['MySettings'] = MySettings;
    return _data;
  }
}

class DayActivity {
  DayActivity({
    required this.week,
    required this.day,
    required this.detail,
    this.image,
  });
  late final int week;
  late final int day;
  late final String detail;
  late final String? image;

  DayActivity.fromJson(Map<String, dynamic> json){
    week = json['week'];
    day = json['day'];
    detail = json['detail'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['week'] = week;
    _data['day'] = day;
    _data['detail'] = detail;
    _data['image'] = image;
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