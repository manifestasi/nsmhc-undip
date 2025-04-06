import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/**
  *  Widget untuk item pada page body scan
  * @author : Manifestasi
  */

Widget ItemBodyCard(BuildContext context,
    {required double? height,
    required double? width,
    required String? asset,
    RxBool? is_checked,
    required String? label}) {
  return Container(
    height: 120.h,
    width: width,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: (is_checked!.value)
                    ? [
                        const BoxShadow(
                          color: Colors.amber,
                          blurRadius: 8.0,
                          spreadRadius: 8.0,
                          offset: const Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ]
                    : null,
                borderRadius: BorderRadius.circular(10.dm)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  is_checked!.value = !is_checked.value;
                },
                splashColor: Colors.amber,
                hoverColor: Colors.amber,
                child: Center(
                  child: Image.asset(
                    width: 40.dm,
                    height: 40.dm,
                    asset!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.h),
            child: Text(
              label!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins", color: Colors.white, fontSize: 12.sp),
            ),
          )
        ]),
  );
}
