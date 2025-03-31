import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Card/banner_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: const Color.fromRGBO(227, 192, 152, 1),
          systemNavigationBarDividerColor:
              const Color.fromRGBO(185, 115, 69, 1),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(227, 192, 152, 1.0),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/bg_home.png"))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Text(
                          "Nursing Students\nMother Heart\nConnection",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:30.w, bottom: 15.h),
                            child: Text("Tahapan", style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18.sp, 
                              fontWeight: FontWeight.bold, 
                              color: Colors.white 
                            ),),
                          ),  

                          Padding(
                              padding: EdgeInsets.only(bottom: 140.h),
                              child: CarouselSlider.builder(
                                itemCount: TextUtilsData.banner_labels().length,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.9,
                                  aspectRatio: 2.0,
                                  initialPage: 0,
                                ),
                                itemBuilder: (_, index, page) {
                                  return BannerHome(context,
                                      asset: TextUtilsData.banner_images()[index],
                                      label: TextUtilsData.banner_labels()[index],
                                      width_box: 0.85,
                                      radius: 20.dm,
                                      height_img:
                                          MediaQuery.of(context).size.height * 0.3,
                                      width_img: 200.w);
                                },
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DraggableScrollableSheet(
                    minChildSize: 0.2,
                    maxChildSize: 0.3,
                    initialChildSize: 0.2,
                    builder: (_, scroll){
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.dm), 
                            topRight: Radius.circular(10.dm))
                        ),
                        child: SingleChildScrollView(
                          controller: scroll,
                          child: Column(
                            children: [

                              SizedBox(
                                height: 20.h,
                              ),  

                              Text("Ayo Mulai!", 
                              style: TextStyle(
                                fontFamily: "Poppins", 
                                fontSize: 18.sp, 
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(185, 115, 69, 1),
                              ),),
                              SizedBox(height: 20.h),
                            RoundedButton(
                              context,
                              is_border: true,
                              onTap: () {
                                Navigator.pushNamed(context, "/materi_screen");
                              },
                              text: "Mulai",
                              shadow_color: Color.fromARGB(255, 159, 158, 158),
                              color: const Color.fromRGBO(242, 162, 99, 1.0),
                              fontSize: 18.sp,
                              height_percent: 0.08,
                              width_percent: 0.9,
                              radius: 20.dm,
                            ),
                            ],
                          ),
                        ),
                      );
                    }),
                )
              ],
            ),
          ),
        ));
  }
}
