import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * untuk alert dialog
 * 
 */

Future<dynamic> DialogPop(BuildContext context,
    {Widget? icon,
    double height = 0.05,
    double width = 0.8,
    bool is_good = true,
    String? label,
    bool? dismissable = true}) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    backgroundColor: (is_good)
                        ? const Color.fromRGBO(0, 168, 70, 1)
                        : Colors.red,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 20.dm,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      label!,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                ],
              )),
        );
      });
}
