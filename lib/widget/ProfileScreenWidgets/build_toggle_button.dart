import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

Widget buildToggleButton({required String firstText, required String secondText}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(30),
    ),
    child: ToggleSwitch(
      minWidth: 90.0,
      cornerRadius: 20.0,
      activeBgColors: const [
        [Colors.white],
        [Colors.white]
      ],
      activeFgColor: Colors.black,
      inactiveBgColor: Colors.grey.shade300,
      inactiveFgColor: Colors.grey,
      initialLabelIndex: 0,
      totalSwitches: 2,
      labels: [firstText, secondText],
      radiusStyle: true,
      onToggle: (index) {
        // print('switched to: $index');
      },
    ),
  );
}
