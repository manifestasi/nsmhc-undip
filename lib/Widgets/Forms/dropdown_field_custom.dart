import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget DropdownFieldCustom(
    BuildContext context, {
        required List<DropdownMenuItem<String>>? items, 
        required void Function(String?)? onChanged,
        required double radius,
        required String label,
        Color backgroundColor = Colors.white,
        num width_percent = 0.8,
        Color border_color = Colors.black, 
        
    }){
   return Container(
    decoration: BoxDecoration(
        color: backgroundColor, 
        borderRadius: BorderRadius.circular(radius),
    ),
     width: MediaQuery.of(context).size.width * width_percent,   
     child: DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(
                  color: border_color,
                  fontFamily: "Poppins",
                  fontSize: 18.sp),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: border_color))),
      ),
   ); 
}