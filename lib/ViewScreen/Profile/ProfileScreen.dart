import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/AppLayer/Provider.dart';
import 'package:fitnessapp/Utils/appColors.dart';
import 'package:fitnessapp/ViewScreen/Profile/ProfileManager.dart';
import 'package:fitnessapp/ViewScreen/Profile/ProfileModel.dart';
import 'package:fitnessapp/widget/MyButton.dart';
import 'package:fitnessapp/widget/first_name_lastname_textfield.dart';
import 'package:fitnessapp/widget/myTextField.dart';
import 'package:fitnessapp/widget/passwordtext_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // File? _image;


  @override
  Widget build(BuildContext context) {
    ProfileManager manager = Provider.of(context).fetch(ProfileManager);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "My Account".tr,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: StreamBuilder<List<ProfileModel>>(
              stream: manager.mainList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProfileModel>? _catList = snapshot.data;
                  ProfileModel course = _catList![0];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: AssetImage("assets/image/1.jfif"),
                                    fit: BoxFit.cover)),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: MyAppColors.pickcolor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("General Info".tr),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: FirstName_lastName_textfield(
                                onChanged: null,
                                errortext: "",
                                obsecure: false,
                                title: "${course.Data1.firstName.toString()}",
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 5,
                              child: FirstName_lastName_textfield(
                                onChanged: null,
                                errortext: "",
                                obsecure: false,
                                title: "${course.Data1.lastName.toString()}",
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        errortext: "",
                        onChanged: null,
                        title: "${course.Data1.email.toString()}".tr,
                        icon: Icons.email_rounded,
                        obsecure: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //Todo: show and hide password
                      MyPassword_TextField(
                        icon: Icons.lock,
                        title: "Confirm Password",
                        onChanged: null,
                        errortext: "",
                        obsecure: true,
                      ),
                      // ShowAndHide(),
                      SizedBox(
                        height: 20,
                      ),
                      // Todo: 2nd pass show and hide
                      MyPassword_TextField(
                        icon: Icons.lock,
                        title: "Confirm Password",
                        onChanged: null,
                        errortext: "",
                        obsecure: true,
                      ),
                      // PassAndHideSecond(),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(
                          shadowColor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                          ontap: () {},
                          containercolor: Overseer.isColor ? MyAppColors.pickcolor:MyAppColors.orangcolors,
                          textcolor: Colors.white,
                          title: "Save".tr)
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
