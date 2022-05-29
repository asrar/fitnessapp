import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_app_bar.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_outlined_color_button.dart';
import 'package:fitnessapp/widget/ProfileScreenWidgets/build_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  final _stopWatchTimer = StopWatchTimer();

  final _isHours = true;
  bool isTimerStart = false;

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: 'Stop Watch'.tr, actions: []),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 36,
                ),
                Container(
                  height: Get.height * 0.7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 7, color: Colors.grey.shade300)),
                  child: Center(
                    child: StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: _stopWatchTimer.rawTime.value,
                      builder: (context, snapshot) {
                        final value = snapshot.data;
                        final displayTime = StopWatchTimer.getDisplayTime(
                            value!,
                            hours: _isHours);
                        return Text(
                          displayTime,
                          style: TextStyle(fontSize: Get.height * 0.06),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTextButton(
                      buttonText: 'Rest'.tr,
                      onTap: () {
                        _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                      },
                    ),
                    isTimerStart == false
                        ? buildOutlinedColorButton(
                      textColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                            containerColor: Overseer.isColor
                                ? MyAppColors.pickcolor.withOpacity(0.2)
                                : MyAppColors.orangcolors.withOpacity(0.2),
                            borderColor: Overseer.isColor
                                ? MyAppColors.pickcolor
                                : MyAppColors.orangcolors,
                            buttonText: 'Start'.tr,
                            onTap: () {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.start);
                              setState(() {
                                isTimerStart = !isTimerStart;
                              });
                            },
                          )
                        : buildOutlinedColorButton(
                      textColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                            containerColor: Overseer.isColor
                                ? MyAppColors.pickcolor
                                : MyAppColors.orangcolors,
                            borderColor: Overseer.isColor
                                ? MyAppColors.pickcolor
                                : MyAppColors.orangcolors,
                            buttonText: 'Stop'.tr,
                            onTap: () {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.stop);
                              setState(() {
                                isTimerStart = !isTimerStart;
                              });
                            },
                          ),
                  ],
                ),
                SizedBox(height: Get.height * 0.03),
              ],
            ),
          ),
        ));
  }
}
