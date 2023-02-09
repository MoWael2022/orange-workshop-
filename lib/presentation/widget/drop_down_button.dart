import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';

import '../Constants/appColor.dart';

class DropDown_Button extends StatelessWidget {
  DropDown_Button(
      {Key? key,
      required this.initialvalue,
      required this.list,
      required this.change,
      required this.text})
      : super(key: key);

  List<String> list;
  String initialvalue;
  var change;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,

          style: TextStyle(
            color: AppColors.black,
            fontSize: 7.w
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),

        ),
        SizedBox(
          width: 35.w,


          child: DecoratedBox(



            decoration: BoxDecoration(

              color: AppColors.white,
              //background color of dropdown button
              border: Border.all(color: AppColors.primaryColor, width: .3.w),

              //border of dropdown button
              borderRadius:
                  BorderRadius.circular(10), //border raiuds of dropdown button
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              child: DropdownButton(
                // Initial Value
                value: initialvalue,


                underline: Container(),

                // Down Arrow Icon
                icon: const Icon(Icons.arrow_drop_down),

                // Array list of items
                items: list.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: change,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
