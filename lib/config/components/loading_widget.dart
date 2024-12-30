import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
 final double size;

  const LoadingWidget({super.key,this.size =30});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size,width: size,child: const CircularProgressIndicator(color: Colors.blueGrey,),);
  }
}
