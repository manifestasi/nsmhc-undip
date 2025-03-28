import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Forms/dropdown_field_custom.dart';
import 'package:nsmhc/Widgets/Forms/form_anak_field.dart';
import 'package:nsmhc/Widgets/Forms/text_field_custom.dart';

class DataAnakScreen extends StatefulWidget {
  const DataAnakScreen({Key? key}) : super(key: key);

  @override
  _DataAnakScreenState createState() => _DataAnakScreenState();
}

class _DataAnakScreenState extends State<DataAnakScreen> {
  var nama_anak_controller = TextEditingController();
  var usia_anak_controller = TextEditingController();

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
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromRGBO(185, 115, 69, 1),
            title: Stack(
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
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),

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
                        border_color: const Color.fromRGBO(185, 115, 69, 1)),

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
                        border_color: const Color.fromRGBO(185, 115, 69, 1)),
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
                      border_color: const Color.fromRGBO(185, 115, 69, 1),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
