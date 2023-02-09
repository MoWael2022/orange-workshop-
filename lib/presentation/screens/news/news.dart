import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';
import 'package:workshop_project/presentation/Constants/appColor.dart';
import 'package:workshop_project/presentation/widget/default_text.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:  DefaultText(text: 'News Screen',color: AppColors.primaryColor,),
      ),
      body:ListView(
       children: [

         Card(
           child:Row(
             children: [
               CircleAvatar(
                 child: Image(
                   image: AssetImage(""),
                 ) ,
                 radius: 30.sp,
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   DefaultText(text: "news title"),
                   DefaultText(text: 'HALLOkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'),

                 ],
               )
             ],
           )
         )
       ],
      )
    );
  }
}
