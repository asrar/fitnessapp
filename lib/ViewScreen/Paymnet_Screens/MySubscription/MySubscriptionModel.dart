class MySubscriptionModel {
  MySubscriptionModel({
    required this.message,
    required this.Data1,
  });
  late final String message;
  late final Data Data1;

  MySubscriptionModel.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.email,
    required this.apiToken,
    required this.trialTo,
    required this.registerVia,
    required this.subscriptionPlanId,
    required this.appleId,
    this.facebookId,
    this.googleId,
    required this.permissions,
    required this.lastLogin,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.bio,
    required this.gender,
    required this.dob,
    required this.age,
    this.pic,
    this.country,
    this.state,
    this.city,
    this.address,
    this.postal,
    required this.FitnessIngrediants1,
    required this.SubscriptionPlan1,
    required this.MySubscriptionpayments1,
    required this.MyNotifications1,
    required this.MyStatistics1,
    required this.MySettings,
  });
  late final int id;
  late final String email;
  late final String apiToken;
  late final String trialTo;
  late final String registerVia;
  late final int subscriptionPlanId;
  late final String appleId;
  late final Null facebookId;
  late final Null googleId;
  late final List<dynamic> permissions;
  late final String lastLogin;
  late final String firstName;
  late final String lastName;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null bio;
  late final String gender;
  late final String dob;
  late final int age;
  late final Null pic;
  late final Null country;
  late final Null state;
  late final Null city;
  late final Null address;
  late final Null postal;
  late final FitnessIngrediants FitnessIngrediants1;
  late final SubscriptionPlan SubscriptionPlan1;
  late final List<MySubscriptionpayments> MySubscriptionpayments1;
  late final MyNotifications MyNotifications1;
  late final List<MyStatistics> MyStatistics1;
  late final List<dynamic> MySettings;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    apiToken = json['api_token'];
    trialTo = json['trial_to'];
    registerVia = json['register_via'];
    subscriptionPlanId = json['subscription_plan_id'];
    appleId = json['apple_id'];
    facebookId = null;
    googleId = null;
    permissions = List.castFrom<dynamic, dynamic>(json['permissions']);
    lastLogin = json['last_login'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    bio = null;
    gender = json['gender'];
    dob = json['dob'];
    age = json['age'];
    pic = null;
    country = null;
    state = null;
    city = null;
    address = null;
    postal = null;
    FitnessIngrediants1 = FitnessIngrediants.fromJson(json['FitnessIngrediants']);
    SubscriptionPlan1 = SubscriptionPlan.fromJson(json['SubscriptionPlan']);
    MySubscriptionpayments1 = List.from(json['MySubscriptionpayments']).map((e)=>MySubscriptionpayments.fromJson(e)).toList();
    MyNotifications1 = MyNotifications.fromJson(json['MyNotifications']);
    MyStatistics1 = List.from(json['MyStatistics']).map((e)=>MyStatistics.fromJson(e)).toList();
    MySettings = List.castFrom<dynamic, dynamic>(json['MySettings']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['api_token'] = apiToken;
    _data['trial_to'] = trialTo;
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
    _data['age'] = age;
    _data['pic'] = pic;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['address'] = address;
    _data['postal'] = postal;
    _data['FitnessIngrediants'] = FitnessIngrediants1.toJson();
    _data['SubscriptionPlan'] = SubscriptionPlan1.toJson();
    _data['MySubscriptionpayments'] = MySubscriptionpayments1.map((e)=>e.toJson()).toList();
    _data['MyNotifications'] = MyNotifications1.toJson();
    _data['MyStatistics'] = MyStatistics1.map((e)=>e.toJson()).toList();
    _data['MySettings'] = MySettings;
    return _data;
  }
}

class FitnessIngrediants {
  FitnessIngrediants({
    required this.id,
    required this.userId,
    required this.fitnessGoalId,
    required this.height,
    required this.heightin,
    required this.weight,
    required this.weightin,
    required this.FitnessGoal1,
  });
  late final int id;
  late final int userId;
  late final int fitnessGoalId;
  late final int height;
  late final String heightin;
  late final int weight;
  late final String weightin;
  late final FitnessGoal FitnessGoal1;

  FitnessIngrediants.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    fitnessGoalId = json['fitness_goal_id'];
    height = json['height'];
    heightin = json['heightin'];
    weight = json['weight'];
    weightin = json['weightin'];
    FitnessGoal1 = FitnessGoal.fromJson(json['FitnessGoal']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['fitness_goal_id'] = fitnessGoalId;
    _data['height'] = height;
    _data['heightin'] = heightin;
    _data['weight'] = weight;
    _data['weightin'] = weightin;
    _data['FitnessGoal'] = FitnessGoal1.toJson();
    return _data;
  }
}

class FitnessGoal {
  FitnessGoal({
    required this.name,
  });
  late final String name;

  FitnessGoal.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

class SubscriptionPlan {
  SubscriptionPlan({
    required this.id,
    required this.title,
    required this.perMonthFee,
    required this.totalFee,
    required this.status,
  });
  late final int id;
  late final String title;
  late final String perMonthFee;
  late final String totalFee;
  late final String status;

  SubscriptionPlan.fromJson(Map<String, dynamic> json){
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

class MySubscriptionpayments {
  MySubscriptionpayments({
    required this.id,
    required this.userId,
    required this.perMonthFee,
    required this.totalFee,
    required this.feeCharge,
    this.paymentId,
    required this.paymentDate,
  });
  late final int id;
  late final int userId;
  late final String perMonthFee;
  late final String totalFee;
  late final String feeCharge;
  late final Null paymentId;
  late final String paymentDate;

  MySubscriptionpayments.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    perMonthFee = json['per_month_fee'];
    totalFee = json['total_fee'];
    feeCharge = json['fee_charge'];
    paymentId = null;
    paymentDate = json['payment_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['per_month_fee'] = perMonthFee;
    _data['total_fee'] = totalFee;
    _data['fee_charge'] = feeCharge;
    _data['payment_id'] = paymentId;
    _data['payment_date'] = paymentDate;
    return _data;
  }
}

class MyNotifications {
  MyNotifications({
    required this.id,
    required this.userId,
    required this.receiveNotifications,
    required this.receiveNewsletter,
    required this.receiveSpecialOffer,
  });
  late final int id;
  late final int userId;
  late final int receiveNotifications;
  late final int receiveNewsletter;
  late final int receiveSpecialOffer;

  MyNotifications.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    receiveNotifications = json['receive_notifications'];
    receiveNewsletter = json['receive_newsletter'];
    receiveSpecialOffer = json['receive_special_offer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['receive_notifications'] = receiveNotifications;
    _data['receive_newsletter'] = receiveNewsletter;
    _data['receive_special_offer'] = receiveSpecialOffer;
    return _data;
  }
}

class MyStatistics {
  MyStatistics({
    required this.id,
    required this.userId,
    required this.distanceCovered,
    required this.calariesGain,
    required this.timeSpand,
    required this.recordDate,
  });
  late final int id;
  late final int userId;
  late final String distanceCovered;
  late final String calariesGain;
  late final String timeSpand;
  late final String recordDate;

  MyStatistics.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    distanceCovered = json['distance_covered'];
    calariesGain = json['calaries_gain'];
    timeSpand = json['time_spand'];
    recordDate = json['record_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['distance_covered'] = distanceCovered;
    _data['calaries_gain'] = calariesGain;
    _data['time_spand'] = timeSpand;
    _data['record_date'] = recordDate;
    return _data;
  }
}