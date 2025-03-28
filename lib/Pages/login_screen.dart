import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Forms/password_field_custom.dart';
import 'package:nsmhc/Widgets/Forms/text_field_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Rx<bool> is_visible_password = Rx<bool>(false);
  GlobalKey<FormState> global_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 162, 99, 1.0),
        body: Stack(
          children: [
            /**
          * image 
           */
            Padding(
              padding: EdgeInsets.only(
                top: 30.h,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/register_logo.png",
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.3,
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
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.dm),
                    topRight: Radius.circular(40.dm),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: SingleChildScrollView(
                    child: Form(
                      key: global_key,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          /**
                           * section form
                           */
                          Text(
                            "Masuk ke Akun Anda",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(141, 77, 36, 1.0),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                    
                          /**
                           * 
                           * Form Email
                           */
                    
                          TextFieldCustom(context,
                              label: "Email",
                              border_color: const Color.fromRGBO(93, 68, 106, 1),
                              radius: 40.dm,
                              width_percent: 0.9),
                          SizedBox(
                            height: 20.h,
                          ),
                    
                          /**
                           * 
                           * Form Password
                           */
                          Obx(() => PasswordFieldCustom(context,
                              label: "Kata Sandi",
                              border_color: const Color.fromRGBO(93, 68, 106, 1),
                              radius: 40.dm,
                              width_percent: 0.9,
                              is_visible: is_visible_password)),
                          SizedBox(
                            height: 20.h,
                          ),
                    
                          /**
                           * Button Mulai
                           */
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoundedButton(
                                  context,
                                  onTap: () {
                                    Navigator.pushNamed(context, "/home_screen");
                                  },
                                  text: "Masuk",
                                  fontSize: 18.sp,
                                  height_percent: 0.08,
                                  width_percent: 0.9,
                                  radius: 40.dm,
                                ),
                    
                                /**
                             * Text belum punya akun
                             * 
                             */
                    
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Belum punya akun? ",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.normal,
                                          color: const Color.fromRGBO(
                                              141, 77, 36, 1.0)),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor: Colors.grey,
                                        hoverColor: Colors.grey,
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/register_screen");
                                        },
                                        child: Text(
                                          "Daftar sekarang!",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16.sp,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromRGBO(
                                                  141, 77, 36, 1.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
