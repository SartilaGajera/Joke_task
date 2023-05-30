import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BgDesign extends StatelessWidget {
  const BgDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Get.width / 2.2,
          height: Get.height / 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.1, 0.5, 0.7, 0.8, 0.9],
              colors: [
                Color(0xfff9bca7),
                Color(0xfff9bda7),
                Color(0xfffac9a1),
                Color(0xfff9c7a6),
                Color(0xfffac9a1),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(Get.height / 4),
            ),
          ),
        ),
      ],
    );
  }
}
