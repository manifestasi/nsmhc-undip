import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget RelaksasiCard(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    // height: MediaQuery.of(context).size.height * 0.2,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(185, 115, 69, 1),
      borderRadius: BorderRadius.circular(20.dm)
    ),
    child: Padding(
      padding: EdgeInsets.all(10.dm),
      child: 
      
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "Lakukan",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            children: [
              TextSpan(
                text: " relaksasi",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " kembali seperti biasa yaitu dengan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " tarik napas dalam",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " secara sempurna dan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " keluarkan perlahan-lahan.",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " Lakukan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " berulang kali",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " sampai ibu merasa",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " rileks",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ]),
      ),
    ),
  );
}
