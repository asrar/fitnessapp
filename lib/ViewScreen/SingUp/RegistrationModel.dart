class RegistrationModel {
  RegistrationModel({
    required this.User1,
    required this.success,
  });
  late final User User1;
  late final String success;

  RegistrationModel.fromJson(Map<String, dynamic> json){
    User1 = User.fromJson(json['User']);
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['User'] = User1.toJson();
    _data['success'] = success;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
    required this.apiToken,
    required this.registerVia,
    required this.subscriptionPlanId,
    required this.appleId,
    this.facebookId,
    this.googleId,
    required this.permissions,
    this.lastLogin,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.bio,
    required this.gender,
    this.dob,
    this.pic,
    this.country,
    this.state,
    this.city,
    this.address,
    this.postal,
    this.FitnessIngrediants,
    required this.SubscriptionPlan1,
    required this.MySubscriptionpayments,
    this.MyNotifications,
    required this.MyStatistics,
    required this.MySettings,
  });
  late final int id;
  late final String email;
  late final String apiToken;
  late final String registerVia;
  late final int subscriptionPlanId;
  late final String appleId;
  late final Null facebookId;
  late final Null googleId;
  late final List<dynamic> permissions;
  late final Null lastLogin;
  late final String firstName;
  late final String lastName;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null bio;
  late final String gender;
  late final Null dob;
  late final Null pic;
  late final Null country;
  late final Null state;
  late final Null city;
  late final Null address;
  late final Null postal;
  late final Null FitnessIngrediants;
  late final SubscriptionPlan SubscriptionPlan1;
  late final List<dynamic> MySubscriptionpayments;
  late final Null MyNotifications;
  late final List<dynamic> MyStatistics;
  late final List<dynamic> MySettings;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    apiToken = json['api_token'];
    registerVia = json['register_via'];
    subscriptionPlanId = json['subscription_plan_id'];
    appleId = json['apple_id'];
    facebookId = null;
    googleId = null;
    permissions = List.castFrom<dynamic, dynamic>(json['permissions']);
    lastLogin = null;
    firstName = json['first_name'];
    lastName = json['last_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    bio = null;
    gender = json['gender'];
    dob = null;
    pic = null;
    country = null;
    state = null;
    city = null;
    address = null;
    postal = null;
    FitnessIngrediants = null;
    SubscriptionPlan1 = SubscriptionPlan.fromJson(json['SubscriptionPlan']);
    MySubscriptionpayments = List.castFrom<dynamic, dynamic>(json['MySubscriptionpayments']);
    MyNotifications = null;
    MyStatistics = List.castFrom<dynamic, dynamic>(json['MyStatistics']);
    MySettings = List.castFrom<dynamic, dynamic>(json['MySettings']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['api_token'] = apiToken;
    _data['register_via'] = registerVia;
    _data['subscription_plan_id'] = subscriptionPlanId;
    _data['apple_id'] = appleId;
    _data['facebook_id'] = facebookId;
    _data['google_id'] = googleId;
    _data['permissions'] = permissions;
    _data['last_login'] = lastLogin;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['bio'] = bio;
    _data['gender'] = gender;
    _data['dob'] = dob;
    _data['pic'] = pic;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['address'] = address;
    _data['postal'] = postal;
    _data['FitnessIngrediants'] = FitnessIngrediants;
    _data['SubscriptionPlan'] = SubscriptionPlan1.toJson();
    _data['MySubscriptionpayments'] = MySubscriptionpayments;
    _data['MyNotifications'] = MyNotifications;
    _data['MyStatistics'] = MyStatistics;
    _data['MySettings'] = MySettings;
    return _data;
  }
}

class SubscriptionPlan {
  SubscriptionPlan({
    required this.id,
    required this.title,
    this.perMonthFee,
    this.totalFee,
    required this.status,
  });
  late final int id;
  late final String title;
  late final Null perMonthFee;
  late final Null totalFee;
  late final String status;

  SubscriptionPlan.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    perMonthFee = null;
    totalFee = null;
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