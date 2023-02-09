import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


import 'package:sizer/sizer.dart';
import 'package:workshop_project/presentation/Constants/appImages_icons.dart';
import 'package:workshop_project/presentation/widget/home_slides.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body:ListView(
          padding: EdgeInsets.fromLTRB(7.w, 0, 7.w, 7.h),
          children: [
            const Image(
              image: AssetImage('assets/assets/images/logo.png'),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Home_Slides(text: "Lecture",picture: AppImage.lecture),
                Home_Slides(text: "sections",picture: AppImage.sections),
              ],
            ),
            SizedBox(height: 6.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Home_Slides(text: "Midterm",picture: AppImage.midterm),
                Home_Slides(text: "Finals",picture : AppImage.app_final),
              ],
            ),
            SizedBox(height: 6.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Home_Slides(text: "Events",picture: AppImage.Events),
                Home_Slides(text: "notes",picture: AppImage.Notes),
              ],
            )

          ],
        )
    ));
  }
}
