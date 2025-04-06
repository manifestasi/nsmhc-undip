import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget BerserahCard(BuildContext context) {
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
                text: " mindfulness spiritual",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " fokus pada",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " emosi",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " secara rutin untuk mengurangi dan menghilangkan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " ketidaknyamanan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " atau",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " penderitaan hidup",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " yang ibu alami",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " \n\nSilakan ibu munculkan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),

              TextSpan(
                text: " kesungguhan hati",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " dengan penuh",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),

              TextSpan(
                text: " perhatian",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " dan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " kesadaran",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " dalam",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " berserah diri kepada Tuhan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " untuk mendapatkan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),

              TextSpan(
                text: " kebaikan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

              TextSpan(
                text: " yang kita inginkan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),

              TextSpan(
                text: " \n\nMudah-mudahan dengan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " pertolongan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " dan",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " izin Tuhan Yang Mahakuasa,",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: " ibu terbebas dari",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              TextSpan(
                text: " penderitaan hidup",
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
