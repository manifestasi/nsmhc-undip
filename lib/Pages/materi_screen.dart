import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Utils/home_clip_path.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';

class MateriScreen extends StatefulWidget {
  const MateriScreen({Key? key}) : super(key: key);

  @override
  _MateriScreenState createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: const Color.fromRGBO(255, 236, 207, 1),
          systemNavigationBarDividerColor:
              const Color.fromRGBO(185, 115, 69, 1),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(242, 162, 99, 1),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg_materi.png"))),
                ),
              ),
              ClipPath(
                clipper: HomeClipPath1(),
                child: Container(
                  height: 120.h,
                  width: double.maxFinite,
                  color: const Color.fromRGBO(255, 236, 207, 1),
                ),
              ),

              /**
               * title materi
               * 
               */

              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   width: 5.w,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: Text(
                        "1. Niat",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(185, 115, 69, 1),
                        ),
                      ),
                    ),

                    /**
                     * 
                     * Tombol Audio
                     */
                    Padding(
                      padding: EdgeInsets.only(right: 30.w),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40.dm,
                          width: 40.dm,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(185, 115, 69, 1),
                                blurRadius: 1.0,
                                spreadRadius: 0.02,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(30.dm),
                            color: const Color.fromRGBO(242, 162, 99, 1),
                          ),
                          child: Icon(
                            Icons.volume_up_sharp,
                            color: Colors.white,
                            size: 20.dm,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 5.w,
                    // ),
                  ],
                ),
              ),

              /**
               * logo materi
               * 
               */

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.98,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100.h, left: 20.w),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                            height: 150.dm,
                            width: 150.dm,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/niat_materi.png"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              TextUtilsData.materi_title()[0],
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              TextUtilsData.materi_stage()[0],
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child:
                    /**
                       * Button Mulai
                       */
                    Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: RoundedButton(
                    context,
                    onTap: () {
                      // Navigator.pushNamed(context, "/login_screen");
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.dm)),
                          ),
                          builder: (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.dm),
                                topRight: Radius.circular(20.dm),
                              )),
                              child: Column(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text: "Pertanyaan\n",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 18.sp,
                                                color: const Color.fromRGBO(
                                                    141, 77, 36, 1),
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text: TextUtilsData
                                                    .materi_question()[0],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 16.sp,
                                                    color: const Color.fromRGBO(
                                                        141, 77, 36, 1),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                  /**
                       * Button Mulai
                       */
                                  RoundedButton(
                                    context,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/login_screen");
                                    },
                                    text: "Lanjut",
                                    fontSize: 18.sp,
                                    height_percent: 0.08,
                                    width_percent: 0.9,
                                    radius: 20.dm,
                                  )
                                ],
                              )));
                    },
                    text: "Lanjut",
                    fontSize: 18.sp,
                    is_border: true,
                    border_color: Colors.white,
                    color: const Color.fromRGBO(242, 162, 99, 1),
                    height_percent: 0.08,
                    width_percent: 0.9,
                    radius: 20.dm,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
