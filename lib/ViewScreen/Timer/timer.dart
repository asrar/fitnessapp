import 'dart:async';

import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_app_bar.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_outlined_color_button.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_text_button.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_toggle_button.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/time_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TimerScreen extends StatefulWidget {
  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late String timetodisplay = "";
  late bool started = true;
  late bool stoped = true;
  late int timefortimer;
  late bool canceltimer = false;
  final dur = Duration(seconds: 1);

  void start() {
    setState(() {
      started = false;
      stoped = false;
    });
    timefortimer = ((_volumeValue.toInt() * 60));
    Timer.periodic(dur, (Timer t) {
      setState(() {
        if (timefortimer < 1 || canceltimer == true) {
          t.cancel();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => TimerScreen()));
        }
        {
          timetodisplay = timefortimer.toString();
          timefortimer = timefortimer - 1;
        }
      });
    });
    // debugPrint(timefortimer.toString());
  }

  void stop() {
    setState(() {
      started = true;
      stoped = true;
      canceltimer = true;
    });
  }

  var _volumeValue = 5.0;
  var number12;

  void _setText() {
    setState(() {
      number12 = _volumeValue.toInt();
    });
  }

  List<double> minute = [
    5.0,
    10.0,
    15.0,
    20.0,
    25.0,
    30.0,
    35.0,
    40.0,
    45.0,
    50.0,
    55.0,
    60.0,
    65.0,
    70.0,
    75.0,
    80.0,
    85.0,
    90.0,
    95.0,
    100.0,
  ];
  List<String> minutext = [
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
    "Min",
  ];

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }

  late int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Timer'.tr, actions: []),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.height * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.3,
                width: double.infinity,
                child: Stack(
                  children: [
                    SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        startAngle: 270,
                        endAngle: 270,
                        showLabels: false,
                        showTicks: false,
                        radiusFactor: 0.6,
                        axisLineStyle: AxisLineStyle(
                            cornerStyle: CornerStyle.bothFlat,
                            color: Colors.black12,
                            thickness: 12),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: _volumeValue,
                            cornerStyle: CornerStyle.bothFlat,
                            width: 12,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                          ),
                          MarkerPointer(
                              value: _volumeValue,
                              enableDragging: true,
                              onValueChanged: onVolumeChanged,
                              markerHeight: 20,
                              markerWidth: 20,
                              markerType: MarkerType.circle,
                              color: const Color(0xFFF8BBD0),
                              borderWidth: 2,
                              borderColor: Colors.white54)
                        ],
                      )
                    ]),
                    Positioned(
                      bottom: Get.height * 0.12,
                      right: Get.width / 2.6,
                      child: Column(
                        children: [
                          Text(_volumeValue.toString().tr),
                          Text('MIN'.tr),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Total Seconds: " + timetodisplay,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: GridView.builder(
                    itemCount: minute.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _volumeValue = minute[index];
                            _selectedindex = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: _selectedindex == index
                                      ? MyAppColors.pickcolor
                                      : Colors.grey),
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(minute[index].toString()),
                              Text(minutext[index]),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: Get.height * 0.01),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextButton(
                    buttonText: 'Cancel'.tr,
                    onTap: () => stoped ? null! : stop(),
                  ),
                  buildOutlinedColorButton(
                    textColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                    containerColor: Overseer.isColor ? MyAppColors.pickcolor.withOpacity(0.2):MyAppColors.orangcolors.withOpacity(0.2),
                    borderColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                    buttonText: 'Start'.tr,
                    onTap: () => started ? start() : null!,
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
