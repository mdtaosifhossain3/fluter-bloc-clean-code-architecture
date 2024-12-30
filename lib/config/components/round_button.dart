import 'package:bloc_clean_code_architecture/config/colors/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final double height;
  final double? width;
  const RoundButton({super.key,required this.title,this.height = 40,this.width, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(color: MyColors.primaryColor,borderRadius: BorderRadius.circular(10)),
      child: InkWell(
          onTap: onClick,
          child: Center(child: Text(title,style: TextStyle(fontSize:18,color: MyColors.whiteColor),))),
    );
  }
}
