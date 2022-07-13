import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Model/modelClass.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/coursemanager.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Homepages/homepage6.dart';
import 'package:fitnessapp/ViewScreen/MenuScreens/menuScreen.dart';
import 'package:fitnessapp/widget/filterScrenLIstview1.dart';
import 'package:fitnessapp/widget/filterscreenListview2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPage3 extends StatefulWidget {
  @override
  _FilterPage3State createState() => _FilterPage3State();
}

class _FilterPage3State extends State<FilterPage3> {
  List<Map<String, dynamic>> rawData = [
    {
      "image": "assets/image/1.jfif",
      "percent": "0%".tr,
      "title1": "Day 1".tr,
      "title2": "Sir Zakir".tr,
    },
    {
      "image": "assets/image/2.jfif",
      "percent": "0%".tr,
      "title1": "Day 2".tr,
      "title2": "Sir Waqar".tr,
    },
    {
      "image": "assets/image/3.jfif",
      "percent": "0%".tr,
      "title1": "Day 3".tr,
      "title2": "Sir Zeeshan".tr,
    },
    {
      "image": "assets/image/4.jfif",
      "percent": "0%".tr,
      "title1": "Day 4".tr,
      "title2": "Sir Ikhlas".tr,
    },
    {
      "image": "assets/image/racling.jfif",
      "percent": "0%".tr,
      "title1": "Day 5".tr,
      "title2": "Sir Nawaz".tr,
    },
  ];
  List<Map<String, dynamic>> weekdata = [
    {
      "image": "assets/image/1.jfif",
      "percent": "0%".tr,
      "title1": "week 1".tr,
      "title2": "Sir Asrar".tr,
    },
    {
      "image": "assets/image/2.jfif",
      "percent": "0%".tr,
      "title1": "week 2".tr,
      "title2": "Sir Waleed".tr,
    },
    {
      "image": "assets/image/3.jfif",
      "percent": "0%".tr,
      "title1": "week 3".tr,
      "title2": "Sir Faheem".tr,
    },
    {
      "image": "assets/image/4.jfif",
      "percent": "0%".tr,
      "title1": "week 4".tr,
      "title2": "Sir Naseer".tr,
    },
    {
      "image": "assets/image/racling.jfif",
      "percent": "0%".tr,
      "title1": "Week 5".tr,
      "title2": "Sir Zain".tr,
    },
  ];

  List<ModelClass> Data = [];
  List<ModelClass> WeekData = [];

  @override
  void initState() {
    super.initState();
    weekdata.forEach((e) {
      WeekData.add(ModelClass.fromJson(e));
    });
    rawData.forEach((element) {
      Data.add(ModelClass.fromJson(element));
    });
  }

  @override
  Widget build(BuildContext context) {
    CourseManager manager = Provider.of(context).fetch(CourseManager);
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: MenuScreen(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(400),
                bottomRight: Radius.circular(400)),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Fitness".tr,
          ),
          leading: Drawericon(),
        ),
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
                  children: [],
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
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trending Workout with tools".tr),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 192,
                        child: StreamBuilder<List<GetCoursesModel>>(
                            stream: manager.mainList,
                            builder: (context, snapshot) {
                              print("Outside snpshot");
                              if (snapshot.hasData) {
                                print("inside snpshot");
                                List<GetCoursesModel>? _catList = snapshot.data;
                                GetCoursesModel course = _catList![0];
                                return ListView.builder(
                                    // shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: _catList[0].Data1.length,
                                    itemBuilder: (context, index) {
                                      {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(HomePage6(
                                              courseId:
                                                  "${course.Data1[index].CourseCategories1.courseId}",
                                              dayAcivityonGoing: [],
                                              videoURL:
                                                  "${course.Data1[index].video}",
                                              dayAcivity: course
                                                  .Data1[index].DayActivity1,
                                              title: course.Data1[index].title,
                                              descriptiom: course
                                                  .Data1[index].description,
                                            ));
                                          },
                                          child: ListViewFIlterScren1(
                                            image: course.Data1[index].image ==
                                                    null
                                                ? "https://images.hdqwalls.com/wallpapers/gym-girl.jpg"
                                                : "${Overseer.course_image_path}/${course.Data1[index].image}",
                                            percent: "0%",
                                            // title1: course.Data[index].title,
                                            title1:
                                                "Day: ${course.Data1[index].daystocompletion.toString()}",
                                            title2:
                                                "${course.Data1[index].description}",

                                            // course.Data1[0].Trainer1 !=
                                            //     null
                                            //     ? "${course.Data1[index].Trainer1!.firstName} ${course.Data1[index].Trainer1!.lastName}"
                                            //     : "${course.Data1[index].Trainer1!.id.toString()}"
                                          ),
                                        );
                                      }
                                    });
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return Center(child: CircularProgressIndicator());
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Workout Without Tools".tr),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 133,
                        child: StreamBuilder<List<GetCoursesModel>>(
                            stream: manager.mainList,
                            builder: (context, snapshot) {
                              print("the bla bla");
                              if (snapshot.hasData) {
                                List<GetCoursesModel>? _catList = snapshot.data;
                                GetCoursesModel course = _catList![0];
                                print(
                                    "the home creen data inside filtr screen ${course.Data1}");
                                return ListView.builder(
                                    // shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: _catList[0].Data1.length,
                                    itemBuilder: (context, index) {
                                      {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(HomePage6(
                                              courseId:
                                                  "${course.Data1[index].CourseCategories1.courseId}",
                                              dayAcivityonGoing: [],
                                              videoURL:
                                                  "${course.Data1[index].video}",
                                              dayAcivity: course
                                                  .Data1[index].DayActivity1,
                                              title: course.Data1[index].title,
                                              descriptiom: course
                                                  .Data1[index].description,
                                            ));
                                          },
                                          child: ListViewFIlterScren2(
                                            image: course.Data1[index].image ==
                                                    null
                                                ? "https://images.hdqwalls.com/wallpapers/gym-girl.jpg"
                                                : "${Overseer.course_image_path}/${course.Data1[index].image}",
                                            percent: "0%",
                                            // title1: course.Data[index].title,
                                            title1:
                                                "Day: ${course.Data1[index].daystocompletion.toString()}",
                                            title2:
                                                "${course.Data1[index].description}",

                                            // course.Data1[0].Trainer1 !=
                                            //     null
                                            //     ? "${course.Data1[index].Trainer1!.firstName} ${course.Data1[index].Trainer1!.lastName}"
                                            //     : "${course.Data1[index].Trainer1!.id.toString()}"
                                          ),
                                        );
                                      }
                                    });
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return Center(child: CircularProgressIndicator());
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Workout With Tools".tr),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 133,
                        child: StreamBuilder<List<GetCoursesModel>>(
                            stream: manager.mainList,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<GetCoursesModel>? _catList = snapshot.data;
                                GetCoursesModel course = _catList![0];
                                return ListView.builder(
                                    // shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: _catList[0].Data1.length,
                                    itemBuilder: (context, index) {
                                      {
                                        return GestureDetector(
                                          onTap: () {
                                            print("for testing");
                                            print(
                                                "th is iamge pat actc ${course.Data1[index].DayActivity1.length}");
                                            Get.to(HomePage6(
                                              courseId:
                                                  "${course.Data1[index].CourseCategories1.courseId}",
                                              dayAcivityonGoing: [],
                                              videoURL:
                                                  "${course.Data1[index].video}",
                                              dayAcivity: course
                                                  .Data1[index].DayActivity1,
                                              title: course.Data1[0].title,
                                              descriptiom:
                                                  course.Data1[0].description,
                                            ));
                                          },
                                          child: ListViewFIlterScren2(
                                            image: course.Data1[index].image ==
                                                    null
                                                ? "https://images.hdqwalls.com/wallpapers/gym-girl.jpg"
                                                : "${Overseer.course_image_path}/${course.Data1[index].image}",
                                            percent: "0%",
                                            // title1: course.Data[index].title,
                                            title1:
                                                "Day: ${course.Data1[index].daystocompletion.toString()}",
                                            title2:
                                                "${course.Data1[index].description}",
                                          ),
                                        );
                                      }
                                    });
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return Center(child: CircularProgressIndicator());
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Drawericon extends StatelessWidget {
  const Drawericon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ImageIcon(
        AssetImage(
          "assets/image/Layer 2.png",
        ),
        color:
            Overseer.isColor ? MyAppColors.pickcolor : MyAppColors.orangcolors,
      ),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}
