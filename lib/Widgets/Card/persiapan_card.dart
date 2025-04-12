import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 
 * widget untuk persiapan card;
 */

Widget persiapanCard(
  BuildContext context, {
    Color? color = const Color.fromRGBO(185, 115, 69, 1),
    Widget? child,
    double? width = 0.7,
    double? height = 0.1
  }){
  return Container(
    width: MediaQuery.of(context).size.width * width!,
    height: MediaQuery.of(context).size.width * height!,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.dm)
    ),
    child: child 
  );
}