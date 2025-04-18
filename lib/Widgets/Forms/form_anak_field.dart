import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Forms/dropdown_field_custom.dart';
import 'package:nsmhc/Widgets/Forms/text_field_custom.dart';

Widget FormAnak(BuildContext context,
    {required String index,
    required List<TextEditingController> list_controllers}) {
  return Column(
    children: [
      SizedBox(
        height: 10.h,
      ),
      Container(
        width: double.maxFinite,
        height: 50.h,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8.0,
            spreadRadius: 0.6,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ], color: Color.fromRGBO(141, 77, 36, 1.0)),
        child: Center(
          child: Text(
            "Data Anak ${index}",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      /**
        * 
        * Form Nama Lengkap Anak
      */

      TextFieldCustom(context,
          text_controller: list_controllers[0],
          label: "Nama Lengkap",
          radius: 40.dm,
          width_percent: 0.9,
          border_color: const Color.fromRGBO(185, 115, 69, 1)),

      /**
                           * 
                           * Form Usia Anak
                           */
      SizedBox(
        height: 20.h,
      ),
      TextFieldCustom(context,
          text_controller: list_controllers[1],
          label: "Usia",
          radius: 40.dm,
          width_percent: 0.9,
          type: TextInputType.number,
          border_color: const Color.fromRGBO(185, 115, 69, 1)),
      SizedBox(
        height: 20.h,
      ),

      /**
      * 
      * Pendidikan terakhir Anak
      */

      DropdownFieldCustom(
        context,
        width_percent: 0.9,
        items: [
          /**
                                   * Item SD
                                   */
          DropdownMenuItem(
            value: TextUtilsData.pendidikan_items()[0],
            child: Text(
              TextUtilsData.pendidikan_items()[0],
              style: TextStyle(
                  fontFamily: "Poppins", fontSize: 16.sp, color: Colors.black),
            ),
          ),
          /**
                                                                       * Item SMP
                                                                       */
          DropdownMenuItem(
            value: TextUtilsData.pendidikan_items()[1],
            child: Text(
              TextUtilsData.pendidikan_items()[1],
              style: TextStyle(
                  fontFamily: "Poppins", fontSize: 16.sp, color: Colors.black),
            ),
          ),
          /**
                                                                       * Item SMA/SMK
                                                                       */
          DropdownMenuItem(
            value: TextUtilsData.pendidikan_items()[2],
            child: Text(
              TextUtilsData.pendidikan_items()[2],
              style: TextStyle(
                  fontFamily: "Poppins", fontSize: 16.sp, color: Colors.black),
            ),
          ),
          /**
                                                                       * Item Diploma
                                                                       */
          DropdownMenuItem(
            value: TextUtilsData.pendidikan_items()[3],
            child: Text(
              TextUtilsData.pendidikan_items()[3],
              style: TextStyle(
                  fontFamily: "Poppins", fontSize: 16.sp, color: Colors.black),
            ),
          ),
          /**
                                                                       * Item Sarjana
                                                                       */
          DropdownMenuItem(
            value: TextUtilsData.pendidikan_items()[4],
            child: Text(
              TextUtilsData.pendidikan_items()[4],
              style: TextStyle(
                  fontFamily: "Poppins", fontSize: 16.sp, color: Colors.black),
            ),
          ),
        ],
        onChanged: (String? sr) {},
        label: 'Pendidikan Terakhir',
        radius: 40.dm,
        border_color: const Color.fromRGBO(93, 68, 106, 1),
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}
