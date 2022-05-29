import 'package:fitnessapp/ViewScreen/Homepages/Courses/OnGoingCourse/ongoingcoursemanager.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/coursemanager.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/LogBook/LogBookManager.dart';
import 'package:fitnessapp/ViewScreen/LogIn/UserManager.dart';
import 'package:fitnessapp/ViewScreen/LogOut/LogOutManager.dart';
import 'package:fitnessapp/ViewScreen/Notification/NotificationManager.dart';
import 'package:fitnessapp/ViewScreen/Paymnet_Screens/MySubscription/MySubscriptionManager.dart';
import 'package:fitnessapp/ViewScreen/Profile/ProfileManager.dart';
import 'package:fitnessapp/ViewScreen/RecomendationScreens/AddCourseSchedule/addCoourseScheduleManager.dart';
import 'package:fitnessapp/ViewScreen/SingUp/SignUpManager.dart';
import 'package:fitnessapp/ViewScreen/SplashScreen/Dictionary/DictionaryManager.dart';
import 'package:fitnessapp/ViewScreen/StartTrial/TrialManager.dart';
import 'package:fitnessapp/ViewScreen/Statistic/MyStatisticManager.dart';
import 'package:fitnessapp/ViewScreen/UpdateFitnessProfile/UpdateFitnessProfileManager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};
  static Map<String, String> monthlyPlan = {"": "", "": "",};
  static Map<String, String> freePlan = {"": "", "": "",};
  static Map<String, String> yearlyPlan = {"": "", "": "",};
  static Map<String, String> quartlyPlan = {"": "", "": ""};
  static Map<String, String> categoryCoursesName = {};
  static Map<String, String> categoryCoursesimage = {};
  static Map<String, int> fitnessGoalMap = {};
  static List<Data> trendingCoursesList = [];
  static List<Data> newCoursesList = [];
  static List<Data> gYMCoursesList = [];
  static List<Data> withToolsMCoursesList = [];
  static List<Data> withoughtToolsMCoursesList = [];
  static List<int> allCategoryCoursesList = [];



  ///
  static DateTime date_of_birth = DateTime.now();
  static String date_of_birth_string = "";
  static int age = 0;
  static String csrf_token_overseer = "";
  static String user_image_path = "";
  static String home_text = "";
  static String home_text_2nd = "";
  static String course_image_path = "";
  static String base_URL = "";
  static String login_status = "";
  static String register_status = "";
  static String videoURL = "";
  static String MainvideoURL = "";
  static String userName = "";
  static String videoCaption = "";
  static String fitnesgoal_name = "";
  static String gender = "";
  static String heightin = "";
  static String weighttin = "";
  static String createUserActivityMessage = "";
  static String signInActivityMessage = "";
  static String scheduleQuery = "";
  static int weight = 0;
  static int height = 0;
  static int userId = 0;
  static int onGoingCoursesLength = 0;
  static int fitnesgoal_id = 0;
  static String freeTrialMessage = "";
  static bool freeTrialEnable = false;
  static bool is_user_valid = false;
  static bool is_user_Registered = false;
  static bool is_Profile_updated = false;
  static bool isColor = false;
  static bool isOngoingSuccess = false;


  // cart values

  Overseer() {
    register(CourseManager, CourseManager());
    register(LogOutManager, LogOutManager());
    register(UserManager, UserManager());
    register(SignUpManager, SignUpManager());
    register(ProfileManager, ProfileManager());
    register(LogBookManager, LogBookManager());
    register(DictionaryManager, DictionaryManager());
    register(TrialManager, TrialManager());
    register(UpdateFitnessProfileManager, UpdateFitnessProfileManager());
    register(MyStatisticManager, MyStatisticManager());
    register(MySubscriptionManager, MySubscriptionManager());
    register(NotificationManager, NotificationManager());
    register(OnGoingCourseManager, OnGoingCourseManager());
    register(AddCoursesScheduleManager, AddCoursesScheduleManager());


// register managers
  }

  static printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // register the manager to this overseer to store in repository
  register(name, object) {
    repository[name] = object;
  }

  // get the required manager from overseer when needed
  fetch(name) {
    return repository[name];
  }
}
