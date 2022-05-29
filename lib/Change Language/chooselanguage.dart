import 'package:flutter/material.dart';

import 'localization_service.dart';
import 'package:get/get.dart';

class ChooseLanguage extends StatefulWidget {


  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  String _selectedLang = LocalizationService.langs.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Choose Your Language".tr,style: TextStyle(color: Colors.black),),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // updates dropdown selected value
                        setState(() => _selectedLang = 'English');
                        // gets language and changes the locale
                        LocalizationService().changeLocale('English');
                      },
                      child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.red.withOpacity(0.4),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("English".tr))),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // updates dropdown selected value
                        setState(() => _selectedLang = 'Türkçe');
                        // gets language and changes the locale
                        LocalizationService().changeLocale('Türkçe');
                      },
                      child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.red.withOpacity(0.4),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("Arabic".tr))),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
