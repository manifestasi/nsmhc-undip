import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Forms/dropdown_field_custom.dart';
import 'package:nsmhc/Widgets/Forms/form_anak_field.dart';
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
  /**
   * text editing controller
   * 
   */
  var usernameController = TextEditingController();
  var namaController = TextEditingController();
  var usiaController = TextEditingController();
  var passController = TextEditingController();
  var confnameController = TextEditingController();
  var alamatController = TextEditingController();
  var hpController = TextEditingController();

  var nama_anak_controller = TextEditingController();
  var usia_anak_controller = TextEditingController();

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
                                    text_controller: usernameController,
                                    label: "Username",
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
                                    text_controller: passController,
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
                                    paired_text_controller: passController,
                                    text_controller: confnameController,
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
                                    text_controller: namaController,
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
                                    text_controller: usiaController,
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
                                      value: "non",
                                      child: Text(
                                        "Tidak Sekolah",
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
                                      value: "SD",
                                      child: Text(
                                        "SD / Setara",
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
                                      value: "SMP",
                                      child: Text(
                                        "SMP / Setara",
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
                                      value: "SMA",
                                      child: Text(
                                        "SMA / Setara",
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
                                      value: "UNIV",
                                      child: Text(
                                        "Perguruan Tinggi (D3, D4, S1, S2, S3)",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? sr) {},
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
                                      value: "BURUH",
                                      child: Text(
                                        "Buruh",
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
                                      value: "KARYAWAN",
                                      child: Text(
                                        "Karyawan Swasta",
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
                                      value: "WIRAUSAHA",
                                      child: Text(
                                        "Wiraswasta",
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
                                      value: "PNS",
                                      child: Text(
                                        "Pegawai Negeri",
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
                                      value: "PEJABAT",
                                      child: Text(
                                        "Pejabat Pemerintah",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),

                                    /**
                               * Item S2
                               */
                                    DropdownMenuItem(
                                      value: "non_work",
                                      child: Text(
                                        "Tidak Bekerja",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? sr) {},
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
                                    text_controller: alamatController,
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
                                    text_controller: hpController,
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
                                    text_controller: nama_anak_controller,
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
                                    text_controller: usia_anak_controller,
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
                                      value: "non",
                                      child: Text(
                                        "Tidak Sekolah",
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
                                      value: "SD",
                                      child: Text(
                                        "SD / Setara",
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
                                      value: "SMP",
                                      child: Text(
                                        "SMP / Setara",
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
                                      value: "SMA",
                                      child: Text(
                                        "SMA / Setara",
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
                                      value: "UNIV",
                                      child: Text(
                                        "Perguruan Tinggi (D3, D4, S1, S2, S3)",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? sr) {},
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
                                RoundedButton(
                                  context,
                                  shadow_color: Color.fromARGB(255, 198, 198, 198),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/profile_screen");
                                  },
                                  text: "Register",
                                  fontSize: 18.sp,
                                  height_percent: 0.08,
                                  width_percent: 0.9,
                                  radius: 20.dm,
                                ),
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
