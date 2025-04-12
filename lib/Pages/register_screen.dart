import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Controller/auth_controller.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Forms/dropdown_field_custom.dart';
import 'package:nsmhc/Widgets/Forms/password_field_confirm.dart';
import 'package:nsmhc/Widgets/Forms/text_field_custom.dart';

import '../Widgets/Forms/password_field_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Rx<bool> is_visible_password = Rx<bool>(false);
  Rx<bool> is_visible_password_confirm = Rx<bool>(false);
  GlobalKey<FormState> global_key = GlobalKey<FormState>();

  var _authController = Get.put(AuthController());
  RxBool? is_pressed = false.obs;

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
             * scroll section 
             *  */
            /**
             * 
             * teks
             */
            DraggableScrollableSheet(
                minChildSize: 0.4,
                maxChildSize: 1.0,
                initialChildSize: 0.5,
                builder: (_, scrollController) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.98,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.dm),
                          topRight: Radius.circular(40.dm),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Form(
                            key: global_key,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Daftar Akun",
                                  style: TextStyle(
                                      color: const Color.fromRGBO(
                                          141, 77, 36, 1.0),
                                      fontFamily: "Poppins",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                /**
                           * section form DATA DIRI
                           */
                                Container(
                                  width: double.maxFinite,
                                  height: 50.h,
                                  decoration: const BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 8.0,
                                      spreadRadius: 0.6,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ], color: Color.fromRGBO(141, 77, 36, 1.0)),
                                  child: Center(
                                    child: Text(
                                      "Data Ibu",
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
                           * Form Username
                           */

                                TextFieldCustom(context,
                                    text_controller:
                                        _authController.emailController,
                                    label: "Email",
                                    radius: 40.dm,
                                    width_percent: 0.9,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1)),
                                /**
                           * 
                           * Form Password
                           */
                                SizedBox(
                                  height: 20.h,
                                ),
                                Obx(() => PasswordFieldCustom(context,
                                    label: "Kata Sandi",
                                    text_controller:
                                        _authController.passController,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1),
                                    radius: 40.dm,
                                    width_percent: 0.9,
                                    is_visible: is_visible_password)),
                                /**
                           * 
                           * Form Password Konfirmasi
                           */
                                SizedBox(
                                  height: 20.h,
                                ),
                                Obx(() => PasswordFieldConfirm(context,
                                    label: "Konfirmasi Kata Sandi",
                                    paired_text_controller:
                                        _authController.passController,
                                    text_controller:
                                        _authController.confnameController,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1),
                                    radius: 40.dm,
                                    width_percent: 0.9,
                                    is_visible: is_visible_password_confirm)),
                                SizedBox(
                                  height: 20.h,
                                ),

                                /**
                           * 
                           * Form Nama Lengkap
                           */

                                TextFieldCustom(context,
                                    text_controller:
                                        _authController.namaController,
                                    label: "Nama Lengkap",
                                    radius: 40.dm,
                                    width_percent: 0.9,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1)),

                                /**
                           * 
                           * Form Usia
                           */
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFieldCustom(context,
                                    text_controller:
                                        _authController.usiaController,
                                    label: "Usia",
                                    radius: 40.dm,
                                    width_percent: 0.9,
                                    type: TextInputType.number,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1)),
                                SizedBox(
                                  height: 20.h,
                                ),

                                /**
                           * 
                           * Pendidikan terakhir
                           */

                                DropdownFieldCustom(
                                  context,
                                  width_percent: 0.9,
                                  items: [
                                    /**
                                                                   * Item SD
                                                                   */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[0],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[0],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                                       * Item SMP
                                                                       */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[1],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[1],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                                       * Item SMA/SMK
                                                                       */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[2],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[2],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                                       * Item Diploma
                                                                       */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[3],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[3],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                                       * Item Sarjana
                                                                       */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[4],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[4],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? sr) {
                                    _authController
                                        .pendidikan_controller.value = sr!;
                                  },
                                  label: 'Pendidikan Terakhir',
                                  radius: 40.dm,
                                  border_color:
                                      const Color.fromRGBO(141, 77, 36, 1.0),
                                ),

                                /**
                           * 
                           * Pekerjaan terakhir
                           */
                                SizedBox(
                                  height: 20.h,
                                ),
                                DropdownFieldCustom(
                                  context,
                                  width_percent: 0.9,
                                  items: [
                                    /**
                                                               * Item buruh
                                                               */
                                    DropdownMenuItem(
                                      value: TextUtilsData.pekerjaan_items()[0],
                                      child: Text(
                                        TextUtilsData.pekerjaan_items()[0],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),

                                    /**
                                                               * Item KARYAWAN SWASTA
                                                               */
                                    DropdownMenuItem(
                                      value: TextUtilsData.pekerjaan_items()[1],
                                      child: Text(
                                        TextUtilsData.pekerjaan_items()[1],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                               * Item Wirausaha
                                                               */
                                    DropdownMenuItem(
                                      value: TextUtilsData.pekerjaan_items()[2],
                                      child: Text(
                                        TextUtilsData.pekerjaan_items()[2],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                               * Item PNS
                                                               */
                                    DropdownMenuItem(
                                      value: TextUtilsData.pekerjaan_items()[3],
                                      child: Text(
                                        TextUtilsData.pekerjaan_items()[3],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),

                                    /**
                                                               * Item Pejabat
                                                               */
                                    DropdownMenuItem(
                                      value: TextUtilsData.pekerjaan_items()[4],
                                      child: Text(
                                        TextUtilsData.pekerjaan_items()[4],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? sr) {
                                    _authController.pekerjaan_controller.value =
                                        sr!;
                                  },
                                  label: 'Pekerjaan Terakhir',
                                  radius: 40.dm,
                                  border_color:
                                      const Color.fromRGBO(141, 77, 36, 1.0),
                                ),

                                /**
                           * 
                           * Form Alamat
                           */
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFieldCustom(context,
                                    text_controller:
                                        _authController.alamatController,
                                    label: "Alamat",
                                    radius: 40.dm,
                                    width_percent: 0.9,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1)),

                                /**
                           * 
                           * Form No.Hp
                           */
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFieldCustom(context,
                                    text_controller:
                                        _authController.hpController,
                                    label: "No.Hp",
                                    radius: 40.dm,
                                    type: TextInputType.phone,
                                    width_percent: 0.9,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1)),

                                /**
                           * section form DATA ANAK
                           */

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
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ], color: Color.fromRGBO(141, 77, 36, 1.0)),
                                  child: Center(
                                    child: Text(
                                      "Data Anak",
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
                          * Form section anak 
                          *
                          */

                                /**
        * 
        * Form Nama Lengkap Anak
      */

                                TextFieldCustom(context,
                                    text_controller:
                                        _authController.nama_anak_controller,
                                    label: "Nama Lengkap",
                                    radius: 40.dm,
                                    width_percent: 0.9,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1)),

                                /**
                           * 
                           * Form Usia Anak
                           */
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFieldCustom(context,
                                    text_controller:
                                        _authController.usia_anak_controller,
                                    label: "Usia",
                                    radius: 40.dm,
                                    width_percent: 0.9,
                                    type: TextInputType.number,
                                    border_color:
                                        const Color.fromRGBO(185, 115, 69, 1)),
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
                                      value:
                                          TextUtilsData.pendidikan_items()[0],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[0],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                                       * Item SMP
                                                                       */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[1],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[1],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                                       * Item SMA/SMK
                                                                       */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[2],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[2],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                                       * Item Diploma
                                                                       */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[3],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[3],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                    /**
                                                                       * Item Sarjana
                                                                       */
                                    DropdownMenuItem(
                                      value:
                                          TextUtilsData.pendidikan_items()[4],
                                      child: Text(
                                        TextUtilsData.pendidikan_items()[4],
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? sr) {
                                    _authController
                                        .pendidikan_anak_controller.value = sr!;
                                  },
                                  label: 'Pendidikan Terakhir',
                                  radius: 40.dm,
                                  border_color:
                                      const Color.fromRGBO(185, 115, 69, 1),
                                ),
                                /**
                       * Button Mulai
                       */
                                SizedBox(
                                  height: 20.h,
                                ),
                                Obx(() {
                                  return (is_pressed!.value)
                                      ? const CircularProgressIndicator(
                                          color:
                                              Color.fromRGBO(242, 162, 99, 1),
                                        )
                                      : RoundedButton(
                                          context,
                                          shadow_color: const Color.fromARGB(
                                              255, 198, 198, 198),
                                          onTap: () async {
                                            /**
                                             * 
                                             * cek apakah field sudah terisi dengan benar.
                                             */

                                            if (global_key.currentState!
                                                    .validate() ==
                                                false) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                "Field tidak boleh kosong atau salah",
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp,
                                                ),
                                              )));
                                            } else {
                                              /**
                                               * jika field sudah benar, maka lakukan post ke API
                                               * untuk registrasi akun.
                                               *  */

                                              is_pressed!.value = true;

                                              await _authController
                                                  .register()
                                                  .then((value) {
                                                is_pressed!.value = false;
                                                log("iki register : $value");

                                                if (value) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                    "Berhasil Registrasi Akun baru!",
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 12.sp,
                                                    ),
                                                  )));

                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context,
                                                          "/login_screen");
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                    "Maaf, gagal registrasi!",
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 12.sp,
                                                    ),
                                                  )));
                                                }
                                              });
                                            }
                                          },
                                          text: "Register",
                                          fontSize: 18.sp,
                                          height_percent: 0.08,
                                          width_percent: 0.9,
                                          radius: 20.dm,
                                        );
                                }),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
