

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class SettingList extends StatelessWidget {
  SettingList({Key? key,required this.text,this.settingPage}) : super(key: key);

  String text;
  var settingPage;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          height: 7.h,

          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return settingPage;
              }));

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 6.w,
                    ),
                  ),
                const Icon(
                  Icons.arrow_forward_ios_outlined
                )

              ],
            ),
          ),
        ),

        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
