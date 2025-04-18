import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Controller/materi_controller.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  var _materiController = Get.put(MateriController());

  @override
  void initState() {
    super.initState();
    _materiController.playAudio("audio/welcome.wav");
    
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: const Color.fromRGBO(242, 162, 99, 1),
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(242, 162, 99, 1),
          body: Stack(children: [
            /**
             * image
             * 
             */
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/splash_logo.png", 
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                  ),
              ),
            ),

            /**
             * 
             * teks
             */
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.dm),
                    topRight: Radius.circular(40.dm),
                    ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left : 20.w, right:20.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 10.h,), 
                      /**
                       * Text Apa itu
                       */
                      Text("Apa itu NSMHC ?", 
                      style: TextStyle(
                        color: const Color.fromRGBO(141, 77, 36, 1.0), 
                        fontSize: 24.sp, 
                        fontWeight: FontWeight.bold, 
                        fontFamily: "Poppins"
                      ),
                      ),
                      
                      /**
                       * Text penjelasan
                       */
                
                      Text(TextUtilsData.WelcomeString(), 
                      style: TextStyle(
                        color: const Color.fromRGBO(141, 77, 36, 1.0), 
                        fontSize: 14.sp, 
                        fontWeight: FontWeight.normal, 
                        fontFamily: "Poppins", 
                      ),
                      textAlign: TextAlign.justify,
                      ),

                      /**
                       * Button Mulai
                       */
                      RoundedButton(context, 
                      onTap: (){
                        _materiController.stopAudio();
                        Navigator.pushNamed(context, "/login_screen");
                      },
                      text: "Mulai", 
                      fontSize: 18.sp,
                      height_percent: 0.08, 
                      width_percent: 0.9, 
                      radius: 20.dm,
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
