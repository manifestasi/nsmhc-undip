import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Forms/dropdown_field_custom.dart';
import 'package:nsmhc/Widgets/Forms/text_field_custom.dart';

class DataDiriScreen extends StatefulWidget {
  const DataDiriScreen({Key? key}) : super(key: key);

  @override
  _DataDiriScreenState createState() => _DataDiriScreenState();
}

class _DataDiriScreenState extends State<DataDiriScreen> {
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

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: const Color.fromRGBO(185, 115, 69, 1),
          systemNavigationBarDividerColor:
              const Color.fromRGBO(242, 162, 99, 1),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(242, 162, 99, 1),
            body: Stack(
              children: [
                /**
                 * 
                 * App Bar
                 */

                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(185, 115, 69, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(185, 115, 69, 1),
                          blurRadius: 8.0,
                          spreadRadius: 0.6,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: () {},
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
                                "Data Ibu",
                                style: TextStyle(
                                    color:
                                        const Color.fromRGBO(255, 236, 206, 1),
                                    fontFamily: "Poppins",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),

                      /**
                       * Akun
                       * 
                       */
                      Container(
                        width: 90.dm,
                        height: 90.dm,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 90.dm,
                              width: 90.dm,
                              child:
                                  // Icon(
                                  //   Icons.person_pin,
                                  //   size: 90.dm,
                                  //   color: const Color.fromRGBO(255, 236, 206, 1),
                                  // )
                                  CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/foto.jpg"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h, right: 3.w),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                      height: 30.dm,
                                      width: 30.dm,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  185, 115, 69, 1)),
                                          borderRadius:
                                              BorderRadius.circular(20.dm),
                                          color: const Color.fromRGBO(
                                              255, 236, 206, 1)),
                                      child: Icon(
                                        Icons.edit,
                                        color: const Color.fromRGBO(
                                            185, 115, 69, 1),
                                      ))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                /**
                 * Section form
                 */
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Form(
                        key: global_key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: 20.h),
                            /**
                               * 
                               * Form Nama Lengkap
                               */

                            TextFieldCustom(context,
                                text_controller: namaController,
                                label: "Nama Lengkap",
                                radius: 40.dm,
                                width_percent: 0.9,
                                backgroundColor:
                                    const Color.fromRGBO(255, 236, 206, 1),
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
                                backgroundColor:
                                    const Color.fromRGBO(255, 236, 206, 1),
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
                              backgroundColor:
                                  const Color.fromRGBO(255, 236, 206, 1),
                              border_color:
                                  const Color.fromRGBO(185, 115, 69, 1),
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
                              backgroundColor:
                                  const Color.fromRGBO(255, 236, 206, 1),
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
                                backgroundColor:
                                    const Color.fromRGBO(255, 236, 206, 1),
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
                                backgroundColor:
                                    const Color.fromRGBO(255, 236, 206, 1),
                                border_color:
                                    const Color.fromRGBO(185, 115, 69, 1)),
                            SizedBox(height: 20.h),
                            RoundedButton(
                              context,
                              is_border: true,
                              onTap: () {
                                Navigator.pushNamed(context, "/profile_screen");
                              },
                              text: "Simpan",
                              shadow_color: Color.fromARGB(255, 159, 158, 158),
                              color: Colors.green,
                              fontSize: 18.sp,
                              height_percent: 0.08,
                              width_percent: 0.9,
                              radius: 20.dm,
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
