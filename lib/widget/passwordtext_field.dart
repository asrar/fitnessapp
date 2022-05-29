import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPassword_TextField extends StatefulWidget {
  final String title;
  final bool obsecure;
  final IconData icon;
  void Function(String value)? onChanged;
  final String errortext;

  MyPassword_TextField(
      {required this.errortext,
      required this.onChanged,
      required this.title,
      required this.icon,
      required this.obsecure});

  @override
  _MyPassword_TextFieldState createState() => _MyPassword_TextFieldState();
}

class _MyPassword_TextFieldState extends State<MyPassword_TextField> {
  final textFieldFocusNode = FocusNode();

  bool _obscured = true;

  late String title;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextField(
        focusNode: textFieldFocusNode,
        onChanged: widget.onChanged,
        obscureText: _obscured,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
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
          prefixIcon: Icon(widget.icon),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: _toggleObscured,
              child: Icon(
                _obscured
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
