import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Controller/materi_controller.dart';

var _materiController = Get.put(MateriController());

Widget MenuTargetMandiri(BuildContext context) {
  return Column(
    children: [TargetMandiriCard(context, label: "ini percobaan")],
  );
}

Widget TargetMandiriCard(BuildContext context, {
  required String label, 
  ValueChanged<dynamic>? onTap1,
  ValueChanged<dynamic>? onTap2,
  dynamic value_1,
  dynamic value_2,
  dynamic group_selected
  }) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(185, 115, 69, 1),
        borderRadius: BorderRadius.circular(20.dm)),
    child: Padding(
      padding: EdgeInsets.all(10.dm),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 18.sp,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 40.h,
                
                child: ElevatedButton(
                    // onPressed: onTap1,
                    onPressed: ()=> onTap1!(value_1),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            (value_1!.value == group_selected!.value)? const Color.fromRGBO(242, 162, 99, 1) : Color.fromRGBO(185, 115, 69, 1)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white, width: 3.dm),
                                borderRadius: BorderRadius.circular(20.dm)))),
                    child: Text("Sudah")),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 40.h,
                child: ElevatedButton(
                    // onPressed: onTap2
                    // ,
                    onPressed: ()=> onTap2!(value_2),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            (value_2!.value == group_selected!.value)? const Color.fromRGBO(242, 162, 99, 1) : Color.fromRGBO(185, 115, 69, 1)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white, width: 3.dm),
                                borderRadius: BorderRadius.circular(20.dm)))),
                    child: Text("Belum")),
              )

            ],
          )
        ],
      ),
    ),
  );
}
