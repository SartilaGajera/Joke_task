import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? horizontalPadding;

  const CustomButton({Key? key, required this.text,  this.color, this.horizontalPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       margin:  EdgeInsets.symmetric(horizontal:horizontalPadding?? Get.width/4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: color??const Color(0xfffd9800),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
