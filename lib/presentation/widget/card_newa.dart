import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../Constants/appColor.dart';
import 'default_text.dart';

class CardNews extends StatelessWidget {
  const CardNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
        child:Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.black,
              radius: 30.sp,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultText(text: "news title"),
                DefaultText(text: 'HALLO'),

              ],
            )
          ],
        )
    );
  }
}
