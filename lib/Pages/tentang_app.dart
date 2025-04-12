import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Widgets/Alerts/apresiasi_pop.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';

class TentangApp extends StatefulWidget {
  const TentangApp({Key? key}) : super(key: key);

  @override
  _TentangAppState createState() => _TentangAppState();
}

class _TentangAppState extends State<TentangApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: const Color.fromRGBO(185, 115, 69, 1),
        systemNavigationBarDividerColor: const Color.fromRGBO(242, 162, 99, 1),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 236, 206, 1),
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
                    "Tentang Aplikasi",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "NSMHC",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(185, 115, 69, 1),
                ),
              ),
              Text(
                "Versi 1.0.0",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromRGBO(185, 115, 69, 1),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Icon(
                Icons.info_outline,
                color: const Color.fromRGBO(185, 115, 69, 1),
                size: 150.dm,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "C 2025-2026 NSMHC",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromRGBO(185, 115, 69, 1),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RoundedButton(
                context, 
                color: const Color.fromRGBO(185, 115, 69, 1),
                width_percent: 0.5,
                height_percent: 0.08,
                radius: 40.dm,
                text: "Lisensi",
                fontSize: 16.sp,
                onTap: (){
                  ApresiasiPop(context);
                  // Navigator.pushNamed(context, "/lisensi_screen");
                }
                )
            ],
          ),
        ),
      ),
    );
  }
}
