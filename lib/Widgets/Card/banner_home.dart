import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * @brief:
 * Function untuk membuat widget banner carousel.
 * @author : manifestasi.my.id
 * 
 */


Widget BannerHome(BuildContext context,
    {double radius = 10,
    num width_box = 0.5,
    num height_box = 0.2,
    double width_img = 100,
    double height_img = 100,
    required String? asset,
    required String? label}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * height_box + 30,
    width: MediaQuery.of(context).size.width * width_box,
    child: Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * height_box,
          width: MediaQuery.of(context).size.width * width_box,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Color.fromRGBO(255, 236, 206, 1)),
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 3.w),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * width_box * 0.5,
                  child: Text(
                    label!,
                    style: TextStyle(
                      color: const Color.fromRGBO(185, 115, 69, 1),
                      fontFamily: "Poppins",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Image.asset(
            asset!,
            fit: BoxFit.cover,
            height: height_img,
            width: width_img,
          ),
        ),
      ),
    ]),
  );
}
