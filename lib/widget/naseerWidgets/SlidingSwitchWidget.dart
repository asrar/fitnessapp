import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

class SlidingSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return



        Center(
          child: SlidingSwitch(
            value: false,
            width: 120,
            onChanged: (bool value) {
              print(value);
            },
            height: 35,
            animationDuration:  Duration(milliseconds: 400),
            onTap: () {},
            onDoubleTap: () {},
            onSwipe: () {},
            textOff: "AM",
            textOn: "PM",
            colorOn: const Color(0xffFFFFFF),
            colorOff: const Color(0xffFFFFFF),
            background: const Color(0xffe4e5eb),
            buttonColor: const Color(0xffFF69BF),
            inactiveColor: const Color(0xff636f7b),
          ),


    );
  }
}