import 'dart:io';
import 'package:fitnessapp/AppLayer/Provider.dart' as pro;
import 'package:fitnessapp/ViewScreen/SplashScreen/splashScreen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AppLayer/Overseer.dart';
import 'Change Language/localization_service.dart';

bool isdark = false;

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

// appBarTheme: AppBarTheme(brightness: Brightness.dark),
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return pro.Provider(
        data: Overseer(),
        child: GetMaterialApp(
          themeMode: ThemeMode.dark,
          title: "Fitness",
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.black),
            // drawerTheme: DrawerThemeData(backgroundColor: Colors.transparent),

            textTheme: TextTheme(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(),
            ).apply(
              bodyColor: Colors.orange,
              displayColor: Colors.blue,
            ),
            scaffoldBackgroundColor: Colors.transparent,
            fontFamily: "Gilroy",
          ),
          debugShowCheckedModeBanner: false,
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          home: SPlashScreen1(),
        ));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
