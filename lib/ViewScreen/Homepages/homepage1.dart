import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Model/modelClass.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/filterpage3.dart';
import 'package:fitnessapp/ViewScreen/Homepages/homepage6.dart';
import 'package:fitnessapp/ViewScreen/Homepages/recommendation7.dart';
import 'package:fitnessapp/ViewScreen/Paymnet_Screens/PaymentScreen.dart';
import 'package:fitnessapp/ViewScreen/Profile/ProfileManager.dart';
import 'package:fitnessapp/ViewScreen/Profile/ProfileModel.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/gridviewVertical.dart';
import 'package:fitnessapp/widget/lsitviewHorizental.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'Courses/OnGoingCourse/ongoingcoursemanager.dart';
import 'Courses/coursemanager.dart';
import 'Courses/getCoursesModel.dart';
import 'Courses/OnGoingCourse/myOngoingCoursesModel.dart';
import 'CoursesDetails/coursedetailscreen.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  // List<Map<String, dynamic>> rawData = [
  //   {
  //     "image": "assets/image/1.jfif",
  //     "percent": "0%".tr,
  //     "title1": "40 Videos".tr,
  //     "title2": "Sir Zakir".tr,
  //   },
  //   {
  //     "image": "assets/image/2.jfif",
  //     "percent": "0%".tr,
  //     "title1": "22 Videos".tr,
  //     "title2": "Sir Waqar".tr,
  //   },
  //   {
  //     "image": "assets/image/3.jfif",
  //     "percent": "0%".tr,
  //     "title1": "34 Videos".tr,
  //     "title2": "Sir Zeeshan".tr,
  //   },
  //   {
  //     "image": "assets/image/4.jfif",
  //     "percent": "0%".tr,
  //     "title1": "19 Videos".tr,
  //     "title2": "Sir Ikhlas".tr,
  //   },
  //   {
  //     "image": "assets/image/racling.jfif",
  //     "percent": "0%".tr,
  //     "title1": "12 Videos".tr,
  //     "title2": "Sir Nawaz".tr,
  //   },
  // ];
  // List<Map<String, dynamic>> weekdata = [
  //   {
  //     "image": "assets/image/1.jfif",
  //     "percent": "0%".tr,
  //     "title1": "week 1".tr,
  //     "title2": "Sir Asrar".tr,
  //   },
  //   {
  //     "image": "assets/image/2.jfif",
  //     "percent": "0%".tr,
  //     "title1": "week 2".tr,
  //     "title2": "Sir Waleed".tr,
  //   },
  //   {
  //     "image": "assets/image/3.jfif",
  //     "percent": "0%".tr,
  //     "title1": "week 3".tr,
  //     "title2": "Sir Faheem".tr,
  //   },
  //   {
  //     "image": "assets/image/4.jfif",
  //     "percent": "0%".tr,
  //     "title1": "week 4".tr,
  //     "title2": "Sir Naseer".tr,
  //   },
  //   {
  //     "image": "assets/image/racling.jfif",
  //     "percent": "0%".tr,
  //     "title1": "Week 5".tr,
  //     "title2": "Sir Zain".tr,
  //   },
  // ];

  // List<ModelClass> Data = [];
  // List<ModelClass> WeekData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // weekdata.forEach((e) {
    //   WeekData.add(ModelClass.fromJson(e));
    // });
    // rawData.forEach((element) {
    //   Data.add(ModelClass.fromJson(element));
    // });
  }
  late DateTime curent;
  /// show only Toast and exit the app
  Future<bool> popped() {
    DateTime now = DateTime.now();
    if (curent == null || now.difference(curent) > Duration(seconds: 2)) {
      curent = now;
      Fluttertoast.showToast(
        textColor: Colors.black,
        msg: "Press Back Button Again To Exit",
        toastLength: Toast.LENGTH_SHORT,
      );
      return Future.value(false);
    } else {
      Fluttertoast.cancel();
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // CourseManager manager1 = Provider.of(context).fetch(CourseManager);
    OnGoingCourseManager ongoingmanager =
        Provider.of(context).fetch(OnGoingCourseManager);
    ProfileManager manager = Provider.of(context).fetch(ProfileManager);
    return WillPopScope(
      onWillPop: popped,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      Text("Fitness".tr),
                      IconButton(
                          onPressed: () {
                            Get.to(PaymentScreen());
                          },
                          icon: ImageIcon(
                            AssetImage(
                              "assets/image/Layer 2.png",
                            ),
                            color: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Center(
                        child: Text(
                          "Banner Ads".tr,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    height: Get.height * 0.1,
                    child: Row(
                      children: [
                        Container(
                          height: Get.height * 0.085,
                          width: 62,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: AssetImage("assets/image/3.jfif"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                         Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Hello ${Overseer.userName}"
                                          .tr,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      Overseer.onGoingCoursesLength == 0
                                          ? "Trending Course"
                                          : "Ongoing Course".tr,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 145,
                    child: StreamBuilder<List<MyOngoingCoursesModel>>(
                        stream: ongoingmanager.mainList,
                        builder: (context, snapshot) {
                          print("this ongoing coursees ouside snpshot");
                          if (snapshot.hasData) {
                            print("this ongoing coursees inside snpshot");
                            List<MyOngoingCoursesModel>? _catList = snapshot.data;
                            MyOngoingCoursesModel course = _catList![0];
                            print(
                                "this is the lenth of th data ${course.Data1.length}");
                            return course.Data1.length == 0
                                ? ListView.builder(
                              // shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                Overseer.trendingCoursesList.length,
                                itemBuilder: (context, index) {
                                  {
                                    return GestureDetector(
                                      onTap: () {
                                        // ${Overseer.trendingCoursesList[index].video}
                                        print("video url ");
                                        Get.to(HomePage6(
                                          courseId: "${Overseer.trendingCoursesList[index].CourseCategories1.courseId}",
                                          title:
                                          "${Overseer.trendingCoursesList[index].title}",
                                          videoURL:
                                          "${Overseer.trendingCoursesList[index].video}",
                                          descriptiom:
                                          "${Overseer.trendingCoursesList[index].description}",
                                          dayAcivity: Overseer.trendingCoursesList[index].DayActivity1,
                                          dayAcivityonGoing: [],
                                        ));
                                        //   Get.to(CourseDetails(
                                        //     courseTile: "Trending Course".tr,
                                        //     title: "${Overseer.trendingCoursesList[index].title}",
                                        //     image: "${Overseer.course_image_path}/${Overseer.trendingCoursesList[index].image}",
                                        //     description: "${Overseer.trendingCoursesList[index].description}",
                                        //     totalWeek: "${Overseer.trendingCoursesList[index].totalWeeks}",
                                        //     videoURL: "${Overseer.trendingCoursesList[index].video}",
                                        //     totaldays: "${Overseer.trendingCoursesList[index].daystocompletion}",
                                        //     // datalist: [],
                                        //   ));
                                      },
                                      child: ListViewHorizental(
                                        image: Overseer
                                            .trendingCoursesList[
                                        index]
                                            .image ==
                                            null
                                            ? "https://images.hdqwalls.com/wallpapers/gym-girl.jpg"
                                            : "${Overseer.course_image_path}/${Overseer.trendingCoursesList[index].image}",
                                        percent: "0%",
                                        // title1: course.Data[index].title,
                                        title1:
                                        "${Overseer.trendingCoursesList[index].totalWeeks} Week",
                                        title2:
                                        "${Overseer.trendingCoursesList[index].description}",
                                      ),
                                    );
                                  }
                                })
                                : ListView.builder(
                              // shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: _catList[0].Data1.length,
                                itemBuilder: (context, index) {
                                  {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(HomePage6(
                                          courseId: "${course.Data1[index].CourseCategories1.courseId}",
                                          title:
                                          "${course.Data1[index].title}",
                                          videoURL:
                                          "${course.Data1[index].video}",
                                          descriptiom:
                                          "${course.Data1[index].description}",
                                          dayAcivity: [],
                                          dayAcivityonGoing: course.Data1[index].DayActivity1,
                                        ));
                                      },
                                      child: ListViewHorizental(
                                        image: course.Data1[index].image ==
                                            null
                                            ? "https://images.hdqwalls.com/wallpapers/gym-girl.jpg"
                                            : "${Overseer.course_image_path}/${course.Data1[index].image}",
                                        percent: "0%",
                                        // title1: course.Data[index].title,
                                        title1:
                                        "${course.Data1[index].totalWeeks.toString()} Week",
                                        title2:
                                        "${course.Data1[index].description}",
                                      ),
                                    );
                                  }
                                });
                          } else if (snapshot.hasError) {
                            return Center(child: CircularProgressIndicator());
                          }

                          return Center(child: CircularProgressIndicator());
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Full Courses".tr)),
                  SizedBox(
                    height: 15,
                  ),
                  //Todo: try
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: GridView.builder(
                        itemCount: Overseer.categoryCoursesName.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            // Overseer.categoryCoursesName.values.elementAt(index) ==
                            onTap: () {


                              if (index == 0) {
                                Get.to(CourseDetails(
                                  title: Overseer.categoryCoursesName.values.elementAt(index),
                                  list: Overseer.newCoursesList,
                                ));
                              } else if (index == 1) {
                                Get.to(CourseDetails(
                                  title: Overseer.categoryCoursesName.values.elementAt(index),
                                  list: Overseer.trendingCoursesList,
                                ));
                              } else if (index == 2) {
                                Get.to(CourseDetails(
                                  title: Overseer.categoryCoursesName.values.elementAt(index),
                                  list: Overseer.withToolsMCoursesList,
                                ));
                              } else if (index == 3) {

                                Get.to(CourseDetails(
                                  title: Overseer.categoryCoursesName.values.elementAt(index),
                                  list: Overseer.withoughtToolsMCoursesList,
                                ));
                              } else if (index == 4) {
                                Get.to(CourseDetails(
                                  title: Overseer.categoryCoursesName.values.elementAt(index),
                                  list: Overseer.trendingCoursesList,
                                ));
                              } else {
                                Get.snackbar("Error", "Not Fount",
                                    dismissDirection: DismissDirection.horizontal,
                                    isDismissible: true);
                              }
                            },
                            child: GridViewVertical(
                              image:
                              "${Overseer.course_image_path}/${Overseer.categoryCoursesimage.values.elementAt(index)}",
                              title1:
                              "${Overseer.allCategoryCoursesList[index]} Videos",
                              title2:
                              "${Overseer.categoryCoursesName.values.elementAt(index)}",
                            ),
                          );
                        }),

                  ),

                  ///
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 23),
                    child: MyButton(
                        shadowColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                        ontap: () {
                          Get.to(Recomandation7());
                        },
                        containercolor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                        textcolor: Colors.white,
                        title: "Recommendation".tr),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
