import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop_project/presentation/Constants/appColor.dart';

//import 'package:flutter_svg/flutter_svg.dart';
class Home_Slides extends StatelessWidget {
  Home_Slides({Key? key, required this.text,required this.picture}) : super(key: key);

  String text;
  String picture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 17.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.white),
          shadowColor: MaterialStateProperty.all<Color>(AppColors.black),
          padding: MaterialStateProperty.all(EdgeInsets.all(1.h)),
          elevation: MaterialStateProperty.all(20),

          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),

            //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
          ),
          //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.speaker_notes_sharp,
            //   color:AppColors.primaryColor,
            //   size: 10.w,
            // ),
            CircleAvatar(
              backgroundColor: Colors.black12,
                child: SvgPicture.asset(
                    picture,
                    color: AppColors.primaryColor,
                ),
            ),
            SizedBox(height: 2.h),
            Text(
              text,
              style: TextStyle(color: AppColors.primaryColor, fontSize: 7.w),
            )
          ],
        ),
      ),
    );
  }
}
