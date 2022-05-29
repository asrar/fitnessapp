import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Homepages/homepage20.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/lsitviewHorizental.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:better_player/better_player.dart';

import 'Courses/OnGoingCourse/myOngoingCoursesModel.dart';
import 'Courses/coursemanager.dart';

class HomePage19 extends StatefulWidget {
  List<DayActivity2> dayAcivityonGoing = [];

  HomePage19({required this.dayAcivityonGoing});

  @override
  _HomePage19State createState() => _HomePage19State();
}

class _HomePage19State extends State<HomePage19> {
  /// better video player
  BetterPlayerController? _betterPlayerController;
  BetterPlayerDataSource? _betterPlayerDataSource;
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan".tr,
    "Feb".tr,
    "Mar".tr,
    "Apr".tr,
    "May".tr,
    "Jun".tr,
    "Jul".tr,
    "Aug".tr,
    "Sep".tr,
    "Oct".tr,
    "Nov".tr,
    "Dec".tr,
  ];

  List<String> listOfDays = [
    "Mon".tr,
    "Tue".tr,
    "Wed".tr,
    "Thu".tr,
    "Fri".tr,
    "Sat".tr,
    "Sun".tr,
  ];

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
      "https://yfitness.com/fitness/public/uploads/courses/hNXOl7kgAx.mp4",
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController!.setupDataSource(_betterPlayerDataSource!);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CourseManager manager = Provider.of(context).fetch(CourseManager);
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                      child: BetterPlayer(controller: _betterPlayerController!),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: Get.height * 0.055,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: Get.height * 0.050,
                                  width: 79,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Overseer.isColor
                                        ? MyAppColors.pickcolor
                                        : MyAppColors.orangcolors,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "30 min".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
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
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Spacer(),
                                CircularPercentIndicator(
                                  radius: Get.height * 0.075,
                                  lineWidth: 5.0,
                                  percent: 0.8,
                                  center: new Text(
                                    "80%".tr,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  progressColor: Overseer.isColor
                                      ? MyAppColors.pickcolor
                                      : MyAppColors.orangcolors,
                                )
                              ],
                            )
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
                          // topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: Get.height * 0.005,
                          ),
                          Container(
                              height: 20,
                              margin: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Center(
                                child: Text(
                                  selectedDate.day.toString() +
                                      '-'.tr +
                                      listOfMonths[selectedDate.month - 1] +
                                      '-'.tr +
                                      selectedDate.year.toString(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                ),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 60,
                            width: 50,
                            margin: EdgeInsets.only(left: 20),
                            child: Container(
                                child: ListView.separated(
                              //     shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(width: 10);
                              },
                              itemCount: 365,
                              controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentDateSelectedIndex = index;
                                      selectedDate = DateTime.now()
                                          .add(Duration(days: index));
                                    });
                                  },
                                  child: Container(
                                    height: 65,
                                    width: Get.width * 0.14,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: currentDateSelectedIndex == index
                                            ? Overseer.isColor
                                                ? MyAppColors.pickcolor
                                                : MyAppColors.orangcolors
                                            : Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          DateTime.now()
                                              .add(Duration(days: index))
                                              .day
                                              .toString()
                                              .tr,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: currentDateSelectedIndex ==
                                                      index
                                                  ? Colors.white
                                                  : Colors.grey),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.005,
                                        ),
                                        Text(
                                          listOfDays[DateTime.now()
                                                      .add(
                                                          Duration(days: index))
                                                      .weekday -
                                                  1]
                                              .toString()
                                              .tr,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: currentDateSelectedIndex ==
                                                      index
                                                  ? Colors.white
                                                  : Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )),
                          ),

                          /// End of Date Area
                          /// /// start ListView
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: Get.height * 0.014,
                          ),

                          Container(
                            child:                            widget.dayAcivityonGoing.length == 0
                                ? Center(
                                child: Text(
                                  "Day Activity Not Found",
                                  style: TextStyle(color: Colors.black),
                                ))
                                : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                // scrollDirection: Axis.horizontal,
                                itemCount: widget.dayAcivityonGoing.length,
                                itemBuilder: (context, index) {
                                  {
                                    return Dismissible(
                                      key: ObjectKey(listOfDays[index]),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: Get.width * 0.8,
                                          margin: EdgeInsets.only(
                                              bottom: 10,
                                              left: 15,
                                              right: 15),
                                          height: 100,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 17),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${Overseer.course_image_path}/${widget.dayAcivityonGoing[index].image}"),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                "${widget.dayAcivityonGoing[index].detail}"
                                                    .tr,
                                                // "abs Training".tr,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                height: 54,
                                                width: Get.width * 0.15,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      100),
                                                  color: Colors.black12
                                                      .withOpacity(0.3),
                                                ),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.slow_motion_video,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        var item =
                                        listOfDays.elementAt(index);
                                        //To delete
                                        deleteItem(index);
                                        //To show a snackbar with the UNDO button
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text("Item deleted"),
                                            action: SnackBarAction(
                                                label: "UNDO",
                                                onPressed: () {
                                                  //To undo deletion
                                                  undoDeletion(
                                                      index, item);
                                                })));
                                      },
                                    );
                                  }
                                }),
                          ),

                          // StreamBuilder<List<GetCoursesModel>>(
                          //     stream: manager.mainList,
                          //     builder: (context, snapshot) {
                          //       if (snapshot.hasData) {
                          //         List<GetCoursesModel>? _catList =
                          //             snapshot.data;
                          //         GetCoursesModel course = _catList![0];
                          //         return ListView.builder(
                          //             shrinkWrap: true,
                          //             physics: NeverScrollableScrollPhysics(),
                          //             itemCount: _catList[0].Data1[0].DayActivity1.length,
                          //             itemBuilder: (context, index) {
                          //               return course.Data1[index].DayActivity1.length == 0 ? Center(
                          //                 child: Text("No Activity Found"),
                          //               ): Container(
                          //                 width: Get.width * 0.8,
                          //                 margin: EdgeInsets.only(
                          //                     bottom: 10, left: 15, right: 15),
                          //                 height: 100,
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 17),
                          //                 decoration: BoxDecoration(
                          //                     color: Colors.red,
                          //                     image: DecorationImage(
                          //                         image: AssetImage(
                          //                             "assets/image/2.jfif"),
                          //                         fit: BoxFit.cover),
                          //                     borderRadius:
                          //                         BorderRadius.circular(10)),
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     Text(
                          //                       "${course.Data1[index].DayActivity1[index].detail}".tr,
                          //                       // "abs Training".tr,
                          //                       style: TextStyle(
                          //                           color: Colors.white),
                          //                     ),
                          //                     Container(
                          //                       height: 54,
                          //                       width: Get.width * 0.15,
                          //                       decoration: BoxDecoration(
                          //                         border: Border.all(
                          //                             color: Colors.white,
                          //                             width: 2),
                          //                         borderRadius:
                          //                             BorderRadius.circular(
                          //                                 100),
                          //                         color: Colors.black12
                          //                             .withOpacity(0.3),
                          //                       ),
                          //                       child: IconButton(
                          //                         onPressed: () {},
                          //                         icon: Icon(
                          //                           Icons.slow_motion_video,
                          //                           color: Colors.white,
                          //                         ),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               );
                          //             });
                          //       } else if (snapshot.hasError) {
                          //         return Center(
                          //             child: CircularProgressIndicator());
                          //       }
                          //       return Center(
                          //           child: CircularProgressIndicator());
                          //     }),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Rest".tr,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.alarm,
                                    color: Colors.grey,
                                  )),
                              Text(
                                "25 Seconds".tr,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: MyButton(
                                shadowColor: MyAppColors.pickcolor,
                                ontap: () {
                                  Get.to(HomePage20());
                                },
                                containercolor: Overseer.isColor
                                    ? MyAppColors.pickcolor
                                    : MyAppColors.orangcolors,
                                textcolor: Colors.white,
                                title: "Start this Program".tr),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteItem(index) {
    setState(() {
      listOfDays.removeAt(index);
    });
  }

  void undoDeletion(index, item) {
    setState(() {
      listOfDays.insert(index, item);
    });
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
