import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';
import 'package:workshop_project/presentation/Constants/appColor.dart';
import 'package:workshop_project/presentation/screens/setting/support.dart';
import 'package:workshop_project/presentation/screens/setting/terms.dart';
import 'package:workshop_project/presentation/widget/default_text.dart';
import 'package:workshop_project/presentation/widget/setting_list.dart';
import 'dart:ffi';
import 'dart:ui';


import 'faq.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(
              padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
              children: [
                Container(
                    alignment: Alignment.center,
                    child : DefaultText(
                      text: 'setting',
                      color: AppColors.black,
                      fontSize: 10.w,
                      bold: FontWeight.bold,
                    )
                ),
                SizedBox(height: 2.h),
                SettingList(text: "FAQ",settingPage: FAQ()),
                SettingList(text: "Terms & Conditions",settingPage: Terms()),
                SettingList(text: "Our Partenrs"),
                SettingList(text: "Support",settingPage: SupportScreen()),
                SettingList(text: "Log out"),
              ],
            )
        )

    );
  }
}



