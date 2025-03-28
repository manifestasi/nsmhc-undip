import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Forms/dropdown_field_custom.dart';
import 'package:nsmhc/Widgets/Forms/text_field_custom.dart';

class DataSuamiScreen extends StatefulWidget {
  const DataSuamiScreen({Key? key}) : super(key: key);

  @override
  _DataSuamiScreenState createState() => _DataSuamiScreenState();
}

class _DataSuamiScreenState extends State<DataSuamiScreen> {
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
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(185, 115, 69, 1),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 18.dm,
              color: const Color.fromRGBO(255, 236, 206, 1),
            ),
            title: Center(
              child: Text(
                "Data Suami",
                style: TextStyle(
                    color: const Color.fromRGBO(255, 236, 206, 1),
                    fontFamily: "Poppins",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Form(
                key: global_key,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        backgroundColor: const Color.fromRGBO(255, 236, 206, 1),
                        border_color: const Color.fromRGBO(185, 115, 69, 1)),

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
                        backgroundColor: const Color.fromRGBO(255, 236, 206, 1),
                        border_color: const Color.fromRGBO(185, 115, 69, 1)),
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
                      backgroundColor: const Color.fromRGBO(255, 236, 206, 1),
                      border_color: const Color.fromRGBO(185, 115, 69, 1),
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
                      backgroundColor: const Color.fromRGBO(255, 236, 206, 1),
                      border_color: const Color.fromRGBO(141, 77, 36, 1.0),
                    ),

                    /**
                                     * 
                                     * Form Alamat
                                     */
                    SizedBox(
                      height: 150.h,
                    ),
                    RoundedButton(
                      context,
                      onTap: () {
                        Navigator.pushNamed(context, "/profile_screen");
                      },
                      text: "Simpan",
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
        ));
  }
}
