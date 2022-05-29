import 'dart:math';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Model/sales.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/ForgetPassword/ForgetPasswordEmailEntry/ForgetPasswordModel.dart';
import 'package:fitnessapp/ViewScreen/Statistic/statistic_Model.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'MyStatisticManager.dart';

class StatisticsScreen extends StatefulWidget {
  // const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int selectedindex = 0;
  late final List<charts.Series<dynamic, String>> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [
      Sales('2015'.tr, random.nextInt(100)),
      Sales('2016'.tr, random.nextInt(100)),
      Sales('2017'.tr, random.nextInt(100)),
      Sales('2018'.tr, random.nextInt(100)),
      Sales('2019'.tr, random.nextInt(100)),
    ];

    final tabletSalesData = [
      Sales('2015'.tr, random.nextInt(100)),
      Sales('2016'.tr, random.nextInt(100)),
      Sales('2017'.tr, random.nextInt(100)),
      Sales('2018'.tr, random.nextInt(100)),
      Sales('2019'.tr, random.nextInt(100)),
    ];

    final mobileSalesData = [
      Sales('2015'.tr, random.nextInt(100)),
      Sales('2016'.tr, random.nextInt(100)),
      Sales('2017'.tr, random.nextInt(100)),
      Sales('2018'.tr, random.nextInt(100)),
      Sales('2019'.tr, random.nextInt(100)),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales'.tr,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          //todo change color from here
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales'.tr,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: tabletSalesData,
        fillColorFn: (Sales sales, _) {
          //todo change color from here
          return charts.MaterialPalette.green.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales'.tr,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: mobileSalesData,
        fillColorFn: (Sales sales, _) {
          //todo change color from here
          return charts.MaterialPalette.deepOrange.shadeDefault;
        },
      )
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      animationDuration: Duration(seconds: 3),
      barGroupingType: charts.BarGroupingType.grouped,

      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
    );
  }

  List<String> dayname = [
    "M".tr,
    "T".tr,
    "W".tr,
    "T".tr,
    "F".tr,
    "S".tr,
  ];

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    MyStatisticManager manager = Provider.of(context).fetch(MyStatisticManager);
    return Scaffold(
      appBar: buildAppBar(title: 'Statistics'.tr, actions: []),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StreamBuilder<List<StatisticModel>>(
              stream: manager.mainList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<StatisticModel>? _catList = snapshot.data;
                  StatisticModel course = _catList![0];
                  return Column(
                    children: [
                      SizedBox(height: Get.height * 0.03),
                      Column(
                        children: [
                          Container(
                            height: Get.height * 0.3,
                            color: const Color(0xFFF3F5F7),
                            child: barChart(),
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('${course.Data1.MyStatistics1[0].distanceCovered} Km'.tr),
                                    Text('Distance'.tr),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('${course.Data1.MyStatistics1[0].calariesGain} Kcal'.tr),
                                    Text('Calories'.tr),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('${course.Data1.MyStatistics1[0].timeSpand.toString()}'.tr),
                                    Text('Time'.tr),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.06),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Statistics with week'.tr),
                            SizedBox(height: Get.height * 0.02),
                            Container(
                              height: Get.height * 0.25,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('This Week'.tr),
                                      const Spacer(),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('View All ►'.tr))
                                    ],
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  Container(
                                    height: 100,
                                    child: ListView.builder(
                                        itemCount: dayname.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (ctx, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedindex = index;
                                              });
                                            },
                                            child: index == 4
                                                ? Column(
                                              children: [
                                                Text("S"),
                                                SizedBox(
                                                    height: Get.height *
                                                        0.01),
                                                Icon(
                                                  Icons.emoji_emotions,
                                                  size:
                                                  Get.height * 0.070,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Container(
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          100)),
                                                )
                                              ],
                                            )
                                                : Column(
                                              children: [
                                                Text(dayname[index]),
                                                SizedBox(
                                                    height: Get.height *
                                                        0.01),
                                                Container(
                                                  margin: EdgeInsets
                                                      .symmetric(
                                                      horizontal: 3),
                                                  height:
                                                  Get.height * 0.080,
                                                  width:
                                                  Get.height * 0.045,
                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    Color(0xFFF3F5F7),
                                                    shape:
                                                    BoxShape.circle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
