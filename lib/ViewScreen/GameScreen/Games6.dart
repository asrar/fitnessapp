import 'dart:math';
import 'dart:async';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/data/some_Data.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/widget/naseerWidgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'Game7.dart';
import '../Setting/Settings.dart';

class Games6 extends StatefulWidget {
  @override
  _Games6State createState() => _Games6State();
}

class _Games6State extends State<Games6> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    incrementIndex();
    iconController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    // audioPlayer.open(Audio('assets/audio/audio.m4a'),
    //     autoStart: false, showNotification: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // iconController!.dispose();
    // audioPlayer.dispose();
    // super.dispose();
  }

  void AnimateIcon() {
    // setState(() {
    //   isAnimated = !isAnimated;
    //   if (isAnimated) {
    //     iconController!.forward();
    //     audioPlayer.play();
    //   } else {
    //     iconController!.reverse();
    //     audioPlayer.pause();
    //   }
    // });
  }

  void stopAudio() {
    // audioPlayer.stop();
    // audioPlayer.dispose();
    // setState(() {
    //   isAnimated = false;
    // });
  }

  /// volume value
  Random random = new Random();
  int randomNumber = 0;
  AnimationController? iconController;
  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;
  // AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  double decrement_Value = 0.1;
  double increment_Value = 0.1;
  int index = 0;
  int volume_decrement_index = 0;
  int volume_increment_index = 0;
  int randomValue = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Zombie Run',
          style: TextStyle(color: Colors.black, letterSpacing: 1),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.width * 1.25,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/2.jpg'),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 50,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Text(
                            DateFormat.jm().format(DateTime.now()),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // Positioned(
                //   top: 50,
                //   left: 24,
                //   child: Container(
                //     height: 120,
                //     width: 120,
                //     child: SfRadialGauge(axes: <RadialAxis>[
                //       RadialAxis(
                //         minimum: 75,
                //         maximum: 125,
                //         startAngle: 270,
                //         endAngle: 270,
                //         showLabels: false,
                //         showTicks: false,
                //         radiusFactor: 0.6,
                //         axisLineStyle: AxisLineStyle(
                //             cornerStyle: CornerStyle.bothFlat,
                //             color: Colors.black12,
                //             thickness: 12),
                //         pointers: <GaugePointer>[
                //           RangePointer(
                //             value: randomValue.toDouble(),
                //             cornerStyle: CornerStyle.bothFlat,
                //             width: 4,
                //             sizeUnit: GaugeSizeUnit.logicalPixel,
                //             color: const Color(0xFFAD1457),
                //           ),
                //           MarkerPointer(
                //               value: randomValue.toDouble(),
                //               enableDragging: true,
                //               markerHeight: 6,
                //               markerWidth: 6,
                //               markerType: MarkerType.circle,
                //               color: const Color(0xFFF8BBD0),
                //               borderWidth: 2,
                //               borderColor: Colors.white54)
                //         ],
                //       )
                //     ]),
                //   ),
                // ),
                Positioned(
                    top: 100,
                    left: 60,
                    child: Text("H/R: " + randomValue.toString())),
                // Positioned(
                //   left: 50,
                //   top: 180,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.black.withOpacity(0.4),
                //         borderRadius: BorderRadius.all(Radius.circular(10))),
                //     height: 60,
                //     width: 150,
                //     child: Center(
                //         child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         InkWell(
                //           child: Icon(
                //             CupertinoIcons.backward_fill,
                //             color: Colors.white,
                //           ),
                //           onTap: () {
                //             audioPlayer.seekBy(Duration(seconds: -10));
                //           },
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             AnimateIcon();
                //           },
                //           child: AnimatedIcon(
                //             icon: AnimatedIcons.play_pause,
                //             progress: iconController,
                //             size: 50,
                //             color: Colors.white,
                //           ),
                //         ),
                //         InkWell(
                //           child: Icon(
                //             CupertinoIcons.forward_fill,
                //             color: Colors.white,
                //           ),
                //           onTap: () {
                //             audioPlayer.seekBy(Duration(seconds: 10));
                //             audioPlayer.seek(Duration(seconds: 10));
                //             audioPlayer.next();
                //           },
                //         ),
                //       ],
                //     )),
                //   ),
                // ),
              ]),
              Divider(),
              SizedBox(
                height: 15,
              ),
              // AudioControlButtons(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Text(
                  'Walk, jog or run anywhere in the world'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              InkWell(
                onTap: () {
                  // audioPlayer.stop();
                  stopAudio();
                  Get.to(Game7());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomButton(
                    color: Overseer.isColor
                        ? MyAppColors.pickcolor
                        : MyAppColors.orangcolors,
                    buttonName: 'Next'.tr,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// generate random seconds

  void random_Second_Generate() {
    setState(() {
      randomNumber = random.nextInt(20);
    });
  }

  /// generate snack bar
  void snackBar(Color color, String withsound) {
    Get.snackbar(
      withsound,
      "This is your Heart Rate ${(randomValue + 1)}\nThe heart rate change\nAfter 15 second ",
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      animationDuration: Duration(seconds: 2),
      leftBarIndicatorColor: Colors.red,
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
      backgroundColor: color,
    );
  }

  ///Audio Controller
  void auto_play_audio() {
    // if (list_Heart_Rate[index] >= 70 && list_Heart_Rate[index] < 80) {
    //   AnimateIcon();
    //   snackBar(Colors.green, "Play Audio with Low Sound");
    //   audioPlayer.setVolume(0.1);
    // } else if (list_Heart_Rate[index] >= 80 && list_Heart_Rate[index] < 90) {
    //   audioPlayer.stop();
    // } else if (list_Heart_Rate[index] >= 90 && list_Heart_Rate[index] < 124) {
    //   AnimateIcon();
    //   audioPlayer.setVolume(0.9);
    //   snackBar(Colors.red, "Play Audio with High Sound");
    // }
  }

  /// Volume Decrement Function
  void Volume_Increment() {
    var seconds = Duration(seconds: 4);
    Timer.periodic(seconds, (Timer t) {
      volume_increment_index++;
      setState(() {
        increment_Value = increment_Volume_Data[volume_increment_index];
      });
    });
  }

  /// Volume Decrement Function

  void volume_decrement() {
    var seconds = Duration(seconds: 4);
    Timer.periodic(seconds, (Timer t) {
      volume_decrement_index++;
      setState(() {
        decrement_Value = decrement_Volume_Data[volume_decrement_index];
      });
    });
  }

  /// increment index

  void incrementIndex() {
    var twosec = Duration(seconds: 15);
    Timer.periodic(twosec, (Timer t) {
      setState(() {
        if (index == list_Heart_Rate.length) {
          decrementIndex();
        }
        if (index < list_Heart_Rate.length) {
          index++;
        }

        /// random_Second_Generate();
        auto_play_audio();
        randomValue = list_Heart_Rate[index];
      });
    });
  }

  /// deccreement index
  void decrementIndex() {
    var twosec = Duration(seconds: 15);

    Timer.periodic(twosec, (Timer t) {
      setState(() {
        if (index == 0) {
          incrementIndex();
        }
        if (index > 0) {
          index--;
        }

        /// auto_play_audio();
        randomValue = list_Heart_Rate[index];
      });
    });
  }
}
