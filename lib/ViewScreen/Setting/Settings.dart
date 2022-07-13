import 'package:fitnessapp/Change%20Language/chooselanguage.dart';
import 'package:fitnessapp/ViewScreen/Themes/Theme2.dart';
import 'package:fitnessapp/ViewScreen/UpdateFitnessProfile/ProfileInformation/BodyStatus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../GameScreen/Games6.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => BodyStatus()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Settings'.tr,
          style: TextStyle(
            letterSpacing: 1,
          ),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Get.to(Games6());
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.tune,
                  color: Colors.black,
                ),
              ),
              title: Text('Fitness Preference'.tr),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Get.to(Theme2());
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.whatshot_rounded,
                  color: Colors.black,
                ),
              ),
              title: Text('Theme'.tr),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.help,
                  color: Colors.black,
                ),
              ),
              title: Text('Help'.tr),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.fingerprint,
                  color: Colors.black,
                ),
              ),
              title: Text('Term and conditions'.tr),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.mail_outline,
                  color: Colors.black,
                ),
              ),
              title: Text('Contact us'.tr),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
              ),
              title: Text('About'.tr),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Get.to(ChooseLanguage());
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.language,
                  color: Colors.black,
                ),
              ),
              title: Text('Language'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
