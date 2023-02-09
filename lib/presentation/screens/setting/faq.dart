import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:workshop_project/presentation/Constants/appColor.dart';
import 'dart:ffi';
import 'dart:ui';

import 'package:workshop_project/presentation/widget/default_text.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
                  text: 'FAQ',
                  color: AppColors.black,
                  fontSize: 10.w,
                  bold: FontWeight.bold,
                )
            ),
          ],
        )
      ),
    );
  }
}
