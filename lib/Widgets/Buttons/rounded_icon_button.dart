import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * @brief Widget Material
 * @author manifestasi
 * 
 * 
 * Function untuk widget icon button template customize.
 */

Widget RoundedIconButton(BuildContext context,
    {required String? text,
    required void Function()? onTap,
    num height_percent = 0.1,
    num width_percent = 0.8,
    double radius = 10,
    required double? fontSize,
    required IconData? icon,
    Color shadow_color = const Color.fromRGBO(185, 115, 69, 1), 
    Color backgroundColor = const Color.fromRGBO(185, 115, 69, 1),
    Color color = const Color.fromRGBO(255, 236, 206, 1)}) {
  return Container(
    height: MediaQuery.of(context).size.height * height_percent,
    width: MediaQuery.of(context).size.width * width_percent,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: shadow_color,
        blurRadius: 10.0,
        spreadRadius: 0.2,
        offset: const Offset(0.0, 3.0), // shadow direction: bottom right
      )
    ], color: color, borderRadius: BorderRadius.circular(radius)),
    child: SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap!();
          },
          splashColor: Colors.grey,
          hoverColor: Colors.grey,
          child: Row(children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
              width: 30.dm,
              height: 30.dm,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(40.dm)),
              child: Center(
                child: Icon(
                  icon!,
                  size: 15.dm,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Text(
              text!,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: fontSize!,
                  color: backgroundColor,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    ),
  );
}
