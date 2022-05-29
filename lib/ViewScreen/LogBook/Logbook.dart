import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/ViewScreen/Setting/Settings.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/coursemanager.dart';
import 'package:fitnessapp/ViewScreen/LogBook/LogBookManager.dart';
import 'package:fitnessapp/ViewScreen/LogBook/LogBookModel.dart';
import 'package:fitnessapp/ViewScreen/RecomendationScreens/Recommendation9.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomCalender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logbook extends StatefulWidget {
  @override
  _LogbookState createState() => _LogbookState();
}

class _LogbookState extends State<Logbook> {

  @override
  Widget build(BuildContext context) {
    LogBookManager manager = Provider.of(context).fetch(LogBookManager);
    // CourseManager manager = Provider.of(context).fetch(CourseManager);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => Recommendation9(courseId: "",)));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Logbook'.tr,
            style: TextStyle(color: Colors.black, letterSpacing: 1),
          ),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Get.to(Settings());
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomCalender(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Warp-Up'.tr,
                        style: TextStyle(color: Colors.grey),
                      ),
                      StreamBuilder<List<LogBookModel>>(
                          stream: manager.mainList,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<LogBookModel>? _catList = snapshot.data;
                              LogBookModel course = _catList![0];
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _catList[0].Data1.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: Get.width * 0.8,
                                      margin: EdgeInsets.only(
                                          bottom: 10, left: 15, right: 15),
                                      height: 100,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 17),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/2.jfif"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: Get.width*0.5,
                                            height: 60,
                                            child: Text(
                                              "${course.Data1[index].title}".tr,maxLines: 3,overflow: TextOverflow.ellipsis,
                                              // "abs Training".tr,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
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
                                    );
                                  });
                            } else if (snapshot.hasError) {
                              return Text("Loading...");
                            }
                            return Center(child: CircularProgressIndicator());
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Reset'.tr,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.alarm,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '25 second'.tr,
                            maxLines: 1,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Warp-Up'.tr,
                        style: TextStyle(color: Colors.grey),
                      ),
                      StreamBuilder<List<LogBookModel>>(
                          stream: manager.mainList,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<LogBookModel>? _catList = snapshot.data;
                              LogBookModel course = _catList![0];
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _catList[0].Data1.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: Get.width * 0.8,
                                      margin: EdgeInsets.only(
                                          bottom: 10, left: 15, right: 15),
                                      height: 100,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 17),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/2.jfif"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: Get.width*0.5,
                                            height: 60,
                                            child: Text(
                                              "${course.Data1[index].title}".tr,maxLines: 3,overflow: TextOverflow.ellipsis,
                                              // "abs Training".tr,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
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
                                    );
                                  });
                            } else if (snapshot.hasError) {
                              return Text("Loading...");
                            }
                            return Center(child: CircularProgressIndicator());
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
