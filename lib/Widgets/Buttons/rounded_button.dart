import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * @brief Widget Material
 * @author manifestasi
 * 
 * 
 * Function untuk widget button template customize.
 */

Widget RoundedButton(BuildContext context,
    {String? text,
    void Function()? onTap,
    num height_percent = 0.1,
    num width_percent = 0.8,
    double radius = 10,
    Color color = const Color.fromRGBO(242, 162, 99, 1)}) {
  return Container(
    height: MediaQuery.of(context).size.height * height_percent,
    width: MediaQuery.of(context).size.width * width_percent,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
    child: SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap,
          splashColor: Colors.grey,
          hoverColor: Colors.grey,
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ),
  );
}
