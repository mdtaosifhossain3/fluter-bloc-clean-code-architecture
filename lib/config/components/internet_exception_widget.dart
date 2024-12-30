import 'package:bloc_clean_code_architecture/config/colors/colors.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Icon(Icons.cloud_off,color: MyColors.redColor,size: 60,),
      SizedBox(height:20.00),
      Text("No Internet, Please try again later",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)
    ],),),);
  }
}
