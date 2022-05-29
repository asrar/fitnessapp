import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/filterpage3.dart';
import 'package:fitnessapp/ViewScreen/Statistic/statistics.dart';
import 'package:fitnessapp/widget/page20duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:better_player/better_player.dart';

class HomePage20 extends StatefulWidget {
  @override
  _HomePage20State createState() => _HomePage20State();
}

class _HomePage20State extends State<HomePage20> {
  /// better video player
  BetterPlayerController? _betterPlayerController;
  BetterPlayerDataSource? _betterPlayerDataSource;

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 41,
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
                            size: 20,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(FilterPage3());
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            "End".tr,
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Jumping Jacks".tr),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 207,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: BetterPlayer(controller: _betterPlayerController!),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 178,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 177,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Image.asset("assets/image/step.png"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Step 2".tr)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 177,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Image.asset("assets/image/step.png"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Step 2".tr)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Page20Duration(
                        title: "Duration".tr,
                        time: "00:30 min".tr,
                      ),
                      Page20Duration(
                        title: "Round".tr,
                        time: "3".tr,
                      ),
                      Page20Duration(
                        title: "Round Time".tr,
                        time: "00:10 min".tr,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "BACK".tr,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(StatisticsScreen());
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Overseer.isColor
                                  ? MyAppColors.pickcolor
                                  : MyAppColors.orangcolors,
                            ),
                            child: Center(
                                child: Text(
                              "NEXT".tr,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                        ),
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
