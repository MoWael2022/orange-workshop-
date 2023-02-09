import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:sizer/sizer.dart';
import 'package:workshop_project/firebase_options.dart';

import 'Presentation/Constants/appColor.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'Presentation/screens/login/login.dart';
import 'Presentation/screens/news/news.dart';
import 'Presentation/screens/register/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData(

            //primaryColorDark: Colors.black,
            //     elevatedButtonTheme: ElevatedButtonThemeData(
            //     style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            // ),
            //   ),
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
