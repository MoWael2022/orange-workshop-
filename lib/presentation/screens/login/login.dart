import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop_project/presentation/Constants/appColor.dart';
import 'package:workshop_project/presentation/screens/page_layout/page_layout.dart';
import 'package:workshop_project/presentation/screens/register/signup.dart';
import 'package:workshop_project/presentation/widget/custom_from_text_filed.dart';
import 'package:workshop_project/presentation/widget/default_text.dart';
import 'package:workshop_project/presentation/widget/text_file_filed.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late UserCredential userCredential;

  final email = TextEditingController();

  final password = TextEditingController();
  String text = "dssdsdsd";

  void _setText() {
    setState(() {
      text = password.text;
      print(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
          children: [
            const Image(
              image: AssetImage('assets/assets/images/logo.png'),
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text: "Login",
              color: AppColors.black,
              fontSize: 10.w,
              bold: FontWeight.bold,
            ),
            SizedBox(
              height: 2.h,
            ),
            textfiled(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter Your Email';
                } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
                    .hasMatch(value)) {
                  return 'Please Enter Valid as example@gmail.com';
                }
              },
              text: "E-mail",
              hint: 'E-mail',
              controller: email,
            ),
            SizedBox(
              height: 2.h,
            ),
            textfiled(
              validator: (val) {
                if (val.isEmpty) {
                  return 'Please Enter Your Password';
                }
              },
              text: "Password",
              hint: "password",
              controller: password,
            ),
            SizedBox(
              height: .25.h,
            ),
            const TextButton(
              onPressed: null,
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            firebaseUIButton(context, "Login", () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                email: email.text,
                password: password.text,
              )
                  .then((value) {
                Fluttertoast.showToast(
                    msg: "Successfully Login",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageLayout(),
                    ),
                        (route) => false);
              }).onError((error, stackTrace) {
                Fluttertoast.showToast(
                    msg: "Invalid E-mail or Password",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              });
            }),
            SizedBox(
              height: 2.h,
            ),
            Row(children: const <Widget>[
              Expanded(
                  child: Divider(
                color: AppColors.primaryColor,
              )),
              Text("OR"),
              Expanded(
                  child: Divider(
                color: AppColors.primaryColor,
              )),
            ]),
            SizedBox(
              height: 2.h,
            ),
            ElevatedButton(
              child: const Text('Sign up',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30,
                  )),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return RegisterScreen();
                }));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.white),
                padding: MaterialStateProperty.all(EdgeInsets.all(1.h)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(
                      color: AppColors.primaryColor, //color
                    ),
                  ),

                  //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                ),
                //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Container firebaseUIButton(
      BuildContext context, String title, Function onTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(1.h)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
          ),
        ),
        child: Text(title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
