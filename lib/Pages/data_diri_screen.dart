import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nsmhc/Controller/profile_controller.dart';
import 'package:nsmhc/Utils/text_utils.dart';
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

  var _profileController = Get.put(ProfileController());

  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  RxBool? is_pressed = false.obs;

  Future<dynamic> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // _picker.pickImage(source: source)
    setState(() {
      imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });
    return imageFile;
  }

  Future<void> get_profile() async {
    await _profileController.getProfile(context).then((value) {
      _profileController.namaController.text = value.data!.name!;
      _profileController.usiaController.text = value.data!.age!.toString();
      _profileController.pendidikan_controller.value =
          value.data!.last_education!;
      _profileController.pekerjaan_controller.value = value.data!.last_job!;
      _profileController.alamatController.text = value.data!.address!;
      _profileController.hpController.text = value.data!.no_hp!;
    });
  }

  @override
  void initState() {
    get_profile();
    super.initState();
  }

  @override
  void dispose() {
    _profileController.dispose();
    super.dispose();
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
                              child: Obx(() {
                                return (imageFile != null)
                                    ? ClipOval(
                                        child: Image.file(
                                          imageFile!,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : (_profileController.status!.value ==
                                                false ||
                                            _profileController
                                                    .data_user!.data!.foto ==
                                                null)
                                        ? Container(
                                            height: 80.dm,
                                            width: 80.dm,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.dm),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/foto.png"))),
                                          )
                                        : ClipOval(
                                            child: Image.network(
                                              _profileController
                                                  .data_user!.data!.foto!,
                                              height: 80.dm,
                                              width: 80.dm,
                                              fit: BoxFit.fill,
                                            ),
                                          );
                              }),

                              // (imageFile != null)
                              //     ? ClipOval(
                              //         child: Image.file(
                              //           imageFile!,
                              //           fit: BoxFit.fill,
                              //         ),
                              //       )
                              //     : const CircleAvatar(
                              //         backgroundImage:
                              //             AssetImage("assets/images/foto.png"),
                              //       ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h, right: 3.w),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: pickImage,
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
                                        child: const Icon(
                                          Icons.edit,
                                          color:
                                              Color.fromRGBO(185, 115, 69, 1),
                                        )),
                                  )),
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
                                text_controller:
                                    _profileController.namaController,
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
                                text_controller:
                                    _profileController.usiaController,
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

                            Obx(() {
                              return (_profileController
                                          .pendidikan_controller.value ==
                                      "")
                                  ? CircularProgressIndicator()
                                  : DropdownFieldCustom(
                                      context,
                                      value: _profileController
                                          .pendidikan_controller.value,
                                      width_percent: 0.9,
                                      items: [
                                        /**
                                                                   * Item SD
                                                                   */
                                        DropdownMenuItem(
                                          value: TextUtilsData
                                              .pendidikan_items()[0],
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
                                          value: TextUtilsData
                                              .pendidikan_items()[1],
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
                                          value: TextUtilsData
                                              .pendidikan_items()[2],
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
                                          value: TextUtilsData
                                              .pendidikan_items()[3],
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
                                          value: TextUtilsData
                                              .pendidikan_items()[4],
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
                                        _profileController
                                            .pendidikan_controller.value = sr!;
                                      },
                                      label: 'Pendidikan Terakhir',
                                      radius: 40.dm,
                                      backgroundColor: const Color.fromRGBO(
                                          255, 236, 206, 1),
                                      border_color:
                                          const Color.fromRGBO(185, 115, 69, 1),
                                    );
                            }),

                            /**
                           * 
                           * Pekerjaan terakhir
                           */
                            SizedBox(
                              height: 20.h,
                            ),
                            Obx(() {
                              return (_profileController
                                          .pekerjaan_controller.value ==
                                      "")
                                  ? CircularProgressIndicator()
                                  : DropdownFieldCustom(
                                      context,
                                      value: _profileController
                                          .pekerjaan_controller.value,
                                      width_percent: 0.9,
                                      items: [
                                        DropdownMenuItem(
                                          value: TextUtilsData
                                              .pekerjaan_items()[0],
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
                                          value: TextUtilsData
                                              .pekerjaan_items()[1],
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
                                          value: TextUtilsData
                                              .pekerjaan_items()[2],
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
                                          value: TextUtilsData
                                              .pekerjaan_items()[3],
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
                                          value: TextUtilsData
                                              .pekerjaan_items()[4],
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
                                        _profileController
                                            .pekerjaan_controller.value = sr!;
                                      },
                                      label: 'Pekerjaan Terakhir',
                                      radius: 40.dm,
                                      backgroundColor: const Color.fromRGBO(
                                          255, 236, 206, 1),
                                      border_color: const Color.fromRGBO(
                                          141, 77, 36, 1.0),
                                    );
                            }),

                            /**
                               * 
                               * Form Alamat
                               */
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFieldCustom(context,
                                text_controller:
                                    _profileController.alamatController,
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
                                text_controller:
                                    _profileController.hpController,
                                label: "No.Hp",
                                radius: 40.dm,
                                type: TextInputType.phone,
                                width_percent: 0.9,
                                backgroundColor:
                                    const Color.fromRGBO(255, 236, 206, 1),
                                border_color:
                                    const Color.fromRGBO(185, 115, 69, 1)),
                            SizedBox(height: 20.h),
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

                                          await _profileController
                                              .updateUser(imageFile)
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
                                              if (_profileController
                                                      .status_foto!.value ==
                                                  "gagal") {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                  "Gagal update, Ukuran foto maksimal 10 mb!",
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 14.sp,
                                                  ),
                                                )));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                  "Maaf, gagal update!",
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 14.sp,
                                                  ),
                                                )));
                                              }
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
                            }),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return (_profileController.status!.value == false)
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        )
                      : Text("");
                })
              ],
            )));
  }
}
