import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstName_lastName_textfield extends StatefulWidget {
  final String title;
  final bool obsecure;
  void Function(String value)? onChanged;
  final String errortext;

  FirstName_lastName_textfield(
      {required this.errortext,
        required this.onChanged,
        required this.title,
        required this.obsecure});

  @override
  _FirstName_lastName_textfieldState createState() => _FirstName_lastName_textfieldState();
}

class _FirstName_lastName_textfieldState extends State<FirstName_lastName_textfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: widget.obsecure,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                width: 1,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(width: 1, color: Colors.grey)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(width: 1, color: Colors.grey)),
          contentPadding: EdgeInsets.all(10),
          errorText: widget.errortext,
          hintText: widget.title,
        ),
      ),
    );
  }
}
