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
    bool is_border = false,
    Color border_color = Colors.white,  
    double? fontSize, 
    Color shadow_color = const Color.fromARGB(255, 198, 198, 198), 
    Color color = const Color.fromRGBO(242, 162, 99, 1)}) {
  return Container(
    height: MediaQuery.of(context).size.height * height_percent,
    width: MediaQuery.of(context).size.width * width_percent,
    decoration: BoxDecoration(
        boxShadow: [
      BoxShadow(
        color: shadow_color,
        blurRadius: 8.0,
        spreadRadius: 0.02,
        offset: const Offset(0.0, 6.0), // shadow direction: bottom right
      )
    ],  border: (is_border)? Border.all(color: border_color, width: 2.dm ) : null,
        color: color, borderRadius: BorderRadius.circular(radius)),
    child: SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap!();
          },
          splashColor: Colors.grey,
          hoverColor: Colors.grey,
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: fontSize!,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ),
  );
}
