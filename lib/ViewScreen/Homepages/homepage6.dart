import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Model/modelClass.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Homepages/homeScreen19.dart';
import 'package:fitnessapp/ViewScreen/RecomendationScreens/Recommendation9.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/lsitviewHorizental.dart';
import 'package:flutter/cupertino.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Courses/OnGoingCourse/myOngoingCoursesModel.dart';
import 'Courses/coursemanager.dart';

class HomePage6 extends StatefulWidget {
  final String title;
  final String descriptiom;
  final String courseId;
  final String videoURL;
  List<DayActivity> dayAcivity = [];
  List<DayActivity2> dayAcivityonGoing = [];

  HomePage6(
      {required this.courseId,
      required this.dayAcivityonGoing,
      required this.videoURL,
      required this.title,
      required this.descriptiom,
      required this.dayAcivity});

  @override
  _HomePage6State createState() => _HomePage6State();
}

class _HomePage6State extends State<HomePage6> {
  /// better video player
  BetterPlayerController? _betterPlayerController;
  BetterPlayerDataSource? _betterPlayerDataSource;

  ///
  List<Map<String, dynamic>> rawData = [
    {
      "image": "assets/image/1.jfif",
      "percent": "20%".tr,
      "title1": "Day 1".tr,
      "title2": "abs Training".tr,
    },
    {
      "image": "assets/image/2.jfif",
      "percent": "30%".tr,
      "title1": "Day 2".tr,
      "title2": "cds Training".tr,
    },
    {
      "image": "assets/image/3.jfif",
      "percent": "35%".tr,
      "title1": "Day 3".tr,
      "title2": "gts Training".tr,
    },
    {
      "image": "assets/image/4.jfif",
      "percent": "55%".tr,
      "title1": "Day 4".tr,
      "title2": "gpd Training".tr,
    },
    {
      "image": "assets/image/racling.jfif",
      "percent": "70%".tr,
      "title1": "Day 5".tr,
      "title2": "Racling Training".tr,
    },
  ];

  List<ModelClass> Data = [];

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
      looping: true,
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "${Overseer.course_image_path}/${widget.videoURL}",
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController!.setupDataSource(_betterPlayerDataSource!);
    // TODO: implement initState
    super.initState();
    rawData.forEach((element) {
      Data.add(ModelClass.fromJson(element));
    });
  }

  @override
  Widget build(BuildContext context) {
    CourseManager manager = Provider.of(context).fetch(CourseManager);
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        child:
                            BetterPlayer(controller: _betterPlayerController!),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: Get.height * 0.033,
                              right: 25,
                              top: 0,
                              bottom: 73),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.020,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: Get.height * 0.055,
                                    width: 41,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.orange,
                                        size: Get.height * 0.025,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: Get.height * 0.040,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/bookmark.png"),
                                              fit: BoxFit.cover)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.070,
                              ),
                              Text(
                                "Hit Trainer".tr,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                height: Get.height * 0.025,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.35,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    // padding: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: TabBar(
                                indicatorColor: Overseer.isColor
                                    ? MyAppColors.pickcolor
                                    : MyAppColors.orangcolors,
                                labelColor: Colors.orange,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(text: 'Details '.tr),
                                  Tab(text: 'Program'.tr),
                                ],
                              ),
                            ),
                            Container(
                                height: Get.height * 0.53,
                                //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(children: <Widget>[
                                  SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left: 31,
                                            right: 31,
                                            top: Get.height * 0.020),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: Get.height * 0.050,
                                                  width: 79,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Overseer.isColor
                                                        ? MyAppColors.pickcolor
                                                        : MyAppColors
                                                            .orangcolors,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "6W / 4D".tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.015,
                                                ),
                                                Text(
                                                  "Free".tr,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Spacer(),
                                                CircularPercentIndicator(
                                                  radius: Get.height * 0.05,
                                                  lineWidth: 5.0,
                                                  percent: 0.8,
                                                  center: new Text(
                                                    "80%".tr,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  progressColor: Overseer
                                                          .isColor
                                                      ? MyAppColors.pickcolor
                                                      : MyAppColors.orangcolors,
                                                )
                                              ],
                                            ),
                                            Text("${widget.title}".tr,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                )),
                                            SizedBox(
                                              height: Get.height * 0.020,
                                            ),
                                            Text(
                                              "${widget.descriptiom}".tr,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.020,
                                            ),
                                            Text(
                                              "Equipment Needed".tr,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.090,
                                            ),
                                            MyButton(
                                                shadowColor:
                                                    MyAppColors.pickcolor,
                                                ontap: () {
                                                  Get.to(Recommendation9(
                                                    courseId: "",
                                                    // dayAcivity:
                                                    //     widget.dayAcivity,
                                                  ));
                                                },
                                                containercolor: Overseer.isColor
                                                    ? MyAppColors.pickcolor
                                                    : MyAppColors.orangcolors,
                                                textcolor: Colors.white,
                                                title: "Start this Program".tr),
                                          ],
                                        )),
                                  ),
                                  SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: widget.dayAcivityonGoing.length == 0
                                        ? Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(left: 15),
                                            // height: 390,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text("Week 1".tr)),
                                                SizedBox(
                                                  height: Get.height * 0.012,
                                                ),

                                                ///
                                                Container(
                                                  height: Get.height * 0.15,
                                                  child: widget.dayAcivity
                                                              .length ==
                                                          0
                                                      ? Center(
                                                          child: Text(
                                                          "Day Activity Not Found",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ))
                                                      : ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: widget
                                                              .dayAcivity
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            {
                                                              return GestureDetector(
                                                                onTap: () {},
                                                                child:
                                                                    ListViewHorizental(
                                                                  image: widget
                                                                              .dayAcivity[index]
                                                                              .image ==
                                                                          null
                                                                      ? "https://images.hdqwalls.com/wallpapers/gym-girl.jpg"
                                                                      : "${Overseer.course_image_path}/${widget.dayAcivity[index].image}",
                                                                  percent: Data[
                                                                          index]
                                                                      .percent,
                                                                  title1: widget
                                                                      .dayAcivity[
                                                                          index]
                                                                      .day
                                                                      .toString(),
                                                                  title2: widget
                                                                      .dayAcivity[
                                                                          index]
                                                                      .detail,
                                                                ),
                                                              );
                                                            }
                                                          }),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.012,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 15),
                                                  child: MyButton(
                                                      shadowColor: Overseer
                                                              .isColor
                                                          ? MyAppColors
                                                              .pickcolor
                                                          : MyAppColors
                                                              .orangcolors,
                                                      ontap: () {
                                                        Get.to(Recommendation9(
                                                          courseId:
                                                              widget.courseId,
                                                          // dayAcivity: widget.dayAcivity
                                                        ));
                                                      },
                                                      containercolor:
                                                          Overseer.isColor
                                                              ? MyAppColors
                                                                  .pickcolor
                                                              : MyAppColors
                                                                  .orangcolors,
                                                      textcolor: Colors.white,
                                                      title: "Join this Program"
                                                          .tr),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.020,
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(left: 15),
                                            // height: 390,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text("Week 1".tr)),
                                                SizedBox(
                                                  height: Get.height * 0.012,
                                                ),

                                                ///
                                                Container(
                                                  height: Get.height * 0.15,
                                                  child: widget
                                                              .dayAcivityonGoing
                                                              .length ==
                                                          0
                                                      ? Center(
                                                          child: Text(
                                                          "Day Activity Not Found ${widget.dayAcivity.length}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ))
                                                      : ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: widget
                                                              .dayAcivityonGoing
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            {
                                                              return GestureDetector(
                                                                onTap: () {},
                                                                child:
                                                                    ListViewHorizental(
                                                                  image: widget
                                                                              .dayAcivityonGoing[index]
                                                                              .image ==
                                                                          null
                                                                      ? "https://images.hdqwalls.com/wallpapers/gym-girl.jpg"
                                                                      : "${Overseer.course_image_path}/${widget.dayAcivityonGoing[index].image}",
                                                                  percent: Data[
                                                                          index]
                                                                      .percent,
                                                                  title1: widget
                                                                      .dayAcivityonGoing[
                                                                          index]
                                                                      .day
                                                                      .toString(),
                                                                  title2: widget
                                                                      .dayAcivityonGoing[
                                                                          index]
                                                                      .detail,
                                                                ),
                                                              );
                                                            }
                                                          }),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 15),
                                                  child: MyButton(
                                                      shadowColor: Overseer
                                                              .isColor
                                                          ? MyAppColors
                                                              .pickcolor
                                                          : MyAppColors
                                                              .orangcolors,
                                                      ontap: () {
                                                        Get.to(HomePage19(
                                                          dayAcivityonGoing: widget
                                                              .dayAcivityonGoing,
                                                        ));
                                                      },
                                                      containercolor:
                                                          Overseer.isColor
                                                              ? MyAppColors
                                                                  .pickcolor
                                                              : MyAppColors
                                                                  .orangcolors,
                                                      textcolor: Colors.white,
                                                      title:
                                                          "Start this Program"
                                                              .tr),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.020,
                                                ),
                                              ],
                                            ),
                                          ),
                                  ),
                                ]))
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// only use for theme
class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.red,
    disabledColor: Colors.grey.shade400,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.red,
    disabledColor: Colors.grey.shade400,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
