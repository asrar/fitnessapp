import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class FlutterSwitchWidget extends StatefulWidget {
  bool status = false;
  FlutterSwitchWidget({required this.status});
  @override
  _FlutterSwitchWidgetState createState() => _FlutterSwitchWidgetState();
}

class _FlutterSwitchWidgetState extends State<FlutterSwitchWidget> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      activeColor: Colors.green,
      width: 60.0,
      height: 30.0,
      valueFontSize: 25.0,
      toggleSize: 30.0,
      value: this.status,
      borderRadius: 30.0,
      padding: 5.0,
      showOnOff: true,
      onToggle: (val) {
        setState(() {
          this.status = val;
        });
      },
    );
  }
}
