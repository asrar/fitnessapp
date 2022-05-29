import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  String genderText;
  Color color;
  Function() ontap;
  GenderButton ({required this.ontap,required this.genderText, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
         border: Border.all(color: color,

         ),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: InkWell(
          onTap: ontap,
          child: Text(genderText,
          style: TextStyle(
            color: color,
                fontSize: 15,
            letterSpacing: 1
          ),
          ),
        )

      ),
    );
  }
}
