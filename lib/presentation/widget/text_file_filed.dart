import 'package:flutter/material.dart';
import 'package:workshop_project/presentation/Constants/appColor.dart';

class textfiled extends StatelessWidget {
  textfiled({Key? key,
    required this.text,
    required this.hint,
    required this.controller,
    required this.validator,
    this.visibletext = true,
    this.ispassword = false,
  })
      : super(key: key);

  String? text;
  final String hint;
  TextEditingController controller;
  bool visibletext;
  final Function validator;
  bool ispassword;
  Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (val) {
          return validator(val);
        },
        //obscureText: visibletext,
        controller: controller,



        decoration: InputDecoration(
          suffixIcon: ispassword ? InkWell(
            onTap: onTap,
            child: Icon(
              visibletext ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
          ): SizedBox(),
          labelText: text,
          labelStyle: TextStyle(
            color: AppColors.grey,
            decorationColor: AppColors.grey,
          ),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppColors.grey,
              width: 2.0,
            ),
          ),
        ));
  }
}
