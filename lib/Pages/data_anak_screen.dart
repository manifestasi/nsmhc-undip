import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Controller/profile_controller.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Forms/dropdown_field_custom.dart';
import 'package:nsmhc/Widgets/Forms/text_field_custom.dart';

class DataAnakScreen extends StatefulWidget {
  const DataAnakScreen({Key? key}) : super(key: key);

  @override
  _DataAnakScreenState createState() => _DataAnakScreenState();
}

class _DataAnakScreenState extends State<DataAnakScreen> {
  var _profileController = Get.put(ProfileController());
  GlobalKey<FormState> global_key = GlobalKey<FormState>();
  RxBool? is_pressed = false.obs;

  Future<void> get_profile_child() async {
    await _profileController.getProfileChild(context).then((value) {
      _profileController.nama_anak_controller.text = value.data!.name!;
      _profileController.usia_anak_controller.text =
          value.data!.age!.toString();
      _profileController.pendidikan_anak_controller.value =
          value.data!.last_education!;
    });
  }

  @override
  void initState() {
      get_profile_child();
    super.initState();
  }

  

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
                      "Data Anak",
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
                child: Stack(children: [
                  Form(
                    key: global_key,
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
                            text_controller:
                                _profileController.nama_anak_controller,
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
                            text_controller:
                                _profileController.usia_anak_controller,
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

                        Obx(() {
                          return        (_profileController.pendidikan_anak_controller.value == "")?
                        CircularProgressIndicator()
                        :
                         DropdownFieldCustom(
                          context,
                          value: _profileController.pendidikan_anak_controller.value,
                          width_percent: 0.9,
                          items: [
                            /**
                                                                       * Item SD
                                                                       */
                            DropdownMenuItem(
                              value: TextUtilsData.pendidikan_items()[0],
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
                              value: TextUtilsData.pendidikan_items()[1],
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
                              value: TextUtilsData.pendidikan_items()[2],
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
                              value: TextUtilsData.pendidikan_items()[3],
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
                              value: TextUtilsData.pendidikan_items()[4],
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
                            _profileController.pendidikan_anak_controller.value =
                                sr!;
                          },
                          label: 'Pendidikan Terakhir',
                          radius: 40.dm,
                          border_color: const Color.fromRGBO(185, 115, 69, 1),
                        );  
                        }),
                  
                 
                        SizedBox(
                          height: 50.h,
                        ),
                        Obx(() {
                          return (is_pressed!.value)
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : RoundedButton(
                                  context,
                                  is_border: true,
                                  onTap: () async {
                                    /**
                                               * 
                                               * cek apakah field sudah terisi dengan benar.
                                               */
                  
                                    if (global_key.currentState!.validate() ==
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
                  
                                      await _profileController
                                          .updateChild()
                                          .then((value) {
                                        is_pressed!.value = false;
                                        log("iki update : $value");
                  
                                        if (value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                            "Berhasil Update!",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.sp,
                                            ),
                                          )));
                  
                                          Navigator.pop(context);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                            "Maaf, gagal update!",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.sp,
                                            ),
                                          )));
                                        }
                                      });
                                    }
                                  },
                                  text: "Simpan",
                                  shadow_color:
                                      Color.fromARGB(255, 159, 158, 158),
                                  color: Colors.green,
                                  fontSize: 18.sp,
                                  height_percent: 0.08,
                                  width_percent: 0.9,
                                  radius: 20.dm,
                                );
                        })
                      ],
                    ),
                  ),
                  Obx(() {
                    return (_profileController.status_child!.value == false)
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          )
                        : Text("");
                  })
                ]),
              ),
            ),
          ),
        ));
  }
}
