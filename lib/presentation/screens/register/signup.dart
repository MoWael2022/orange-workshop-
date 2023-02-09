import 'dart:ffi';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';

import 'package:sizer/sizer.dart';
import 'package:workshop_project/presentation/Constants/appColor.dart';
import 'package:workshop_project/presentation/screens/login/login.dart';
import 'package:workshop_project/presentation/widget/default_text.dart';
import 'package:workshop_project/presentation/widget/drop_down_button.dart';
import 'package:workshop_project/presentation/widget/text_file_filed.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  final TextEditingController nameconroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller = TextEditingController();
  late UserCredential userCredential;

  var gender = ["Male", "Female"];
  var univercity = ["AUC", "GUC", "ASU"];
  var grade = [
    'F',
    'D',
    'D-',
    'C-',
    'C',
    'C+',
    'B-',
    'B',
    'B+',
    'A-',
    'A',
    'A+'
  ];

  String initialGender = 'Male';
  String initialUniverCity = 'AUC';
  String initialGrade = 'F';

  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    {
      return SafeArea(
        child: Scaffold(
            body: Padding(
          padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 7.h),
          child: ListView(
            children: [
              const Image(
                image: AssetImage('assets/assets/images/logo.png'),
              ),
              SizedBox(height: 1.h),
              DefaultText(
                text: "Register",
                color: AppColors.black,
                fontSize: 10.w,
                bold: FontWeight.bold,
              ),
              SizedBox(height: 2.h),
              textfiled(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Your Name";
                  } else if (value.length > 32) {
                    return "Name Must be less than 32 characters";
                  }
                  ;
                },
                text: "name",
                hint: 'name',
                controller: nameconroller,
              ),

              SizedBox(height: 2.h),
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
                hint: 'e-mail',
                controller: emailcontroller,
              ),
              SizedBox(height: 2.h),
              textfiled(
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please Enter Your Password';
                  }
                },
                ispassword: true,
                text: "Password",
                hint: 'Password',
                controller: passwordcontroller,

              ),
              SizedBox(height: 2.h),
              textfiled(
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please Enter Your Confirm Password';
                  }
                },
                text: "Confirm Password",
                hint: 'Confirm Password',
                controller: confirmpasswordcontroller,
              ),
              SizedBox(height: 2.h),
              textfiled(
                validator: (val) {
                  if (val == null) {
                    return "Please Enter Your Phone Number";
                  } else if (val.length != 11) {
                    return "Phone Number must be 11 number";
                  }
                },
                text: "phone",
                hint: 'phone',
                controller: phonecontroller,
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropDown_Button(
                    initialvalue: initialGender,
                    list: gender,
                    change: (String? newValue) {
                      setState(() {
                        initialGender = newValue!;
                      });
                      // signupCubit.changegender(newValue);
                    },
                    text: "Gender",
                  ),
                  DropDown_Button(
                    initialvalue: initialUniverCity,
                    list: univercity,
                    change: (String? newValue) {
                      setState(() {
                        initialUniverCity = newValue!;
                      });
                    },
                    text: "Univercity",
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                  alignment: Alignment.center,
                  child: DropDown_Button(
                    text: "Grade",
                    initialvalue: initialGrade,
                    list: grade,
                    change: (String? newValue) {
                      setState(() {
                        initialGrade = newValue!;
                      });
                    },
                  )),
              SizedBox(height: 4.h),

              firebaseUIButton(context, "Sign Up", () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                  email: emailcontroller.text,
                  password: passwordcontroller.text,
                )
                    .then((value) {
                  Fluttertoast.showToast(
                      msg: "Successfully Signup",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                  print(emailcontroller.text);
                });
              }),

              SizedBox(height: 2.h),
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
              SizedBox(height: 2.h),
              ElevatedButton(
                child: const Text('Login',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                    )),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return LoginScreen();
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
        )),
      );
    }
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
            backgroundColor:
              MaterialStateProperty.all(AppColors.primaryColor),
              padding: MaterialStateProperty.all(EdgeInsets.all(1.h)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
              ),
        ),
        child: Text('Sign UP',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
