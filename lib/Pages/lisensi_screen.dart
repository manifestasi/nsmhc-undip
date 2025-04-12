import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Utils/text_utils.dart';

class LisensiScreen extends StatelessWidget {
const LisensiScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
   return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: const Color.fromRGBO(185, 115, 69, 1),
        systemNavigationBarDividerColor: const Color.fromRGBO(242, 162, 99, 1),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(141, 77, 36, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(185, 115, 69, 1),
          title: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 20.dm,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromRGBO(255, 236, 206, 1),
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text(
                    "Lisensi",
                    style: TextStyle(
                        color: const Color.fromRGBO(255, 236, 206, 1),
                        fontFamily: "Poppins",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.dm),
                  child: Text(
                    TextUtilsData.lisensi(),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromRGBO(255, 236, 206, 1),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}