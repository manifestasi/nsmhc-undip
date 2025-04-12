import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';

/**
 * untuk alert dialog
 * 
 */

Future<dynamic> ApresiasiPop(BuildContext context,
    {Widget? icon,
    double height = 0.6,
    double width = 0.8,
    bool is_good = true,
    String? label,
    bool? dismissable = false}) {
  return showDialog(
      context: context,
      barrierDismissible: dismissable!,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Loading..."),
          backgroundColor: Colors.white,
          content: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.elasticIn,
              height: MediaQuery.of(context).size.height * height,
              width: MediaQuery.of(context).size.height * width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.dm),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    "assets/images/tt.gif",
                    height: 100.dm,
                    width: 100.dm,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    TextUtilsData.apresiasi(),
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RoundedButton(
                    context,
                    onTap: () async {
                      Navigator.pushReplacementNamed(context, "/home_screen");
                    },
                    text: "Selesai",
                    fontSize: 18.sp,
                    height_percent: 0.08,
                    width_percent: 0.7,
                    radius: 40.dm,
                  )
                ],
              )),
        );
      });
}
