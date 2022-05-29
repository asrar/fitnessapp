class DictionaryModel {
  DictionaryModel({
    required this.message,
    required this.Data1,
  });
  late final String message;
  late final Data Data1;

  DictionaryModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    Data1 = Data.fromJson(json['Data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['Data'] = Data1.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.baseUrl,
    required this.usersImgPath,
    required this.coursesImgPath,
    required this.fitnessGoals,
    required this.tutrialVideos,
    required this.subscriptionsPlan,
    required this.coursesCategories,
    required this.homeText,
    required this.pages,
  });
  late final String baseUrl;
  late final String usersImgPath;
  late final String coursesImgPath;
  late final List<FitnessGoals> fitnessGoals;
  late final List<TutrialVideos> tutrialVideos;
  late final List<SubscriptionsPlan> subscriptionsPlan;
  late final List<CoursesCategories> coursesCategories;
  late final List<String> homeText;
  late final Pages pages;

  Data.fromJson(Map<String, dynamic> json){
    baseUrl = json['baseUrl'];
    usersImgPath = json['users_img_path'];
    coursesImgPath = json['courses_img_path'];
    fitnessGoals = List.from(json['fitnessGoals']).map((e)=>FitnessGoals.fromJson(e)).toList();
    tutrialVideos = List.from(json['tutrialVideos']).map((e)=>TutrialVideos.fromJson(e)).toList();
    subscriptionsPlan = List.from(json['subscriptions_plan']).map((e)=>SubscriptionsPlan.fromJson(e)).toList();
    coursesCategories = List.from(json['courses_categories']).map((e)=>CoursesCategories.fromJson(e)).toList();
    homeText = List.castFrom<dynamic, String>(json['home_text']);
    pages = Pages.fromJson(json['pages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['baseUrl'] = baseUrl;
    _data['users_img_path'] = usersImgPath;
    _data['courses_img_path'] = coursesImgPath;
    _data['fitnessGoals'] = fitnessGoals.map((e)=>e.toJson()).toList();
    _data['tutrialVideos'] = tutrialVideos.map((e)=>e.toJson()).toList();
    _data['subscriptions_plan'] = subscriptionsPlan.map((e)=>e.toJson()).toList();
    _data['courses_categories'] = coursesCategories.map((e)=>e.toJson()).toList();
    _data['home_text'] = homeText;
    _data['pages'] = pages.toJson();
    return _data;
  }
}

class FitnessGoals {
  FitnessGoals({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  FitnessGoals.fromJson(Map<String, dynamic> json){
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

class TutrialVideos {
  TutrialVideos({
    required this.id,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.status,
  });
  late final int id;
  late final String caption;
  late final String videoUrl;
  late final String thumbnail;
  late final int status;

  TutrialVideos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    caption = json['caption'];
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['caption'] = caption;
    _data['video_url'] = videoUrl;
    _data['thumbnail'] = thumbnail;
    _data['status'] = status;
    return _data;
  }
}

class SubscriptionsPlan {
  SubscriptionsPlan({
    required this.id,
    required this.title,
    this.perMonthFee,
    this.totalFee,
    required this.status,
  });
  late final int id;
  late final String title;
  late final String? perMonthFee;
  late final String? totalFee;
  late final String status;

  SubscriptionsPlan.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    perMonthFee = json['per_month_fee'];
    totalFee = json['total_fee'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['per_month_fee'] = perMonthFee;
    _data['total_fee'] = totalFee;
    _data['status'] = status;
    return _data;
  }
}

class CoursesCategories {
  CoursesCategories({
    required this.id,
    required this.title,
    required this.image,
  });
  late final int id;
  late final String title;
  late final String image;

  CoursesCategories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['image'] = image;
    return _data;
  }
}

class Pages {
  Pages({
    required this.terms,
    required this.help,
    required this.contact,
    required this.about,
  });
  late final String terms;
  late final String help;
  late final String contact;
  late final String about;

  Pages.fromJson(Map<String, dynamic> json){
    terms = json['terms'];
    help = json['help'];
    contact = json['contact'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['terms'] = terms;
    _data['help'] = help;
    _data['contact'] = contact;
    _data['about'] = about;
    return _data;
  }
}