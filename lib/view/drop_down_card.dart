import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DropDownCard extends StatelessWidget {
  const DropDownCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color:MediaQuery.of(context).size.width > 585 ?Colors.black.withOpacity(0.1): Colors.black.withOpacity(0.2  ),
                blurRadius: 4,
                offset: const Offset(0, 2))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: customDesc(
                  title: "Filter",
                  color: Colors.black.withOpacity(0.6),
                  size: 16.0),
            ),
          ),
          GestureDetector(onTap: (){

          },
            child: const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
Text customDesc({title,color,max,size}){
  return   Text(
    title,
    maxLines:max?? 3,
    overflow: TextOverflow.ellipsis,
    style:  TextStyle(  color: color??Colors.black,
        fontWeight: FontWeight.w400, fontSize:size?? 18,letterSpacing: -0.2,height: 1.1),
  );
}
Text customSubTitle({title, color, size, weight}) {
  return Text(
    title.toString().capitalize ?? "",
    maxLines: 4,
    style: TextStyle(
      color: color ?? Colors.black,
      fontWeight: weight ?? FontWeight.bold,
      fontSize: size ?? 22,
      letterSpacing: -0.2,
      wordSpacing: 1,
      height: 1.2,
    ),
  );
}