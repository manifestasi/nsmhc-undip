import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nsmhc/Controller/materi_controller.dart';
import 'package:nsmhc/Controller/pref_controller.dart';
import 'package:nsmhc/Controller/profile_controller.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_icon_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _prefController = Get.put(PrefController());
  var _profileController = Get.put(ProfileController());
  var _materiController = Get.put(MateriController());

  Future<void> get_profile() async {
    await _profileController.getProfile(context).then((value) {
      _profileController.namaController.text = value.data!.name!;
      _profileController.usiaController.text = value.data!.age!.toString();
      _profileController.pendidikan_controller.value =
          value.data!.last_education!;
      _profileController.alamatController.text = value.data!.address!;
      _profileController.hpController.text = value.data!.no_hp!;
    });
  }

  @override
  void initState() {
    _materiController.stopAudio();
    get_profile();
    super.initState();
  }

  @override
  void dispose() {
    _profileController.dispose();
    _prefController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: const Color.fromRGBO(185, 115, 69, 1),
          systemNavigationBarDividerColor:
              const Color.fromRGBO(185, 115, 69, 1),
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
                  height: MediaQuery.of(context).size.height * 0.25,
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
                                  Navigator.pushReplacementNamed(context, "/home_screen");
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
                                "Pengaturan",
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

                      Row(
                        children: [
                          Obx(() {
                            return 
                            (_profileController.status!.value == false || _profileController.data_user!.data!.foto == null)
                            // (_profileController.data_user!.data!.foto == null)
                                ? Container(
                                    height: 80.dm,
                                    width: 80.dm,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.dm),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/foto.png"))),
                                  )
                                : ClipOval(
                                    child: Image.network(
                                      _profileController.data_user!.data!.foto!,
                                      height: 80.dm,
                                      width: 80.dm,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                          }),
                          SizedBox(
                            width: 10.w,
                          ),
                          Obx(() {
                            return (_profileController.status!.value == false)
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _profileController
                                            .data_user!.data!.name!,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16.sp,
                                            color: const Color.fromRGBO(
                                                255, 236, 206, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        _profileController
                                            .data_user!.data!.email!,
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14.sp,
                                            color: const Color.fromRGBO(
                                                255, 236, 206, 1),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  );
                          })
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RoundedIconButton(
                          context,
                          onTap: () {
                            Navigator.pushNamed(
                                context, "/edit_profile_screen");
                          },
                          text: "Edit Profile",
                          fontSize: 18.sp,
                          height_percent: 0.08,
                          width_percent: 0.9,
                          radius: 20.dm,
                          icon: LucideIcons.pencil,
                        ),
                        SizedBox(height: 10.h),
                        RoundedIconButton(
                          context,
                          onTap: () async {
                           

                            Navigator.pushNamed(context, "/tentang_screen");
                          },
                          text: "Tentang Aplikasi",
                          fontSize: 18.sp,
                          height_percent: 0.08,
                          width_percent: 0.9,
                          radius: 20.dm,
                          icon: LucideIcons.alertCircle,
                        ),
                        SizedBox(height: 50.h),
                        RoundedIconButton(
                          context,
                          onTap: () async {
                            await _prefController.clearData().then((value) {
                              Navigator.pushReplacementNamed(
                                  context, "/welcome_screen");
                            });
                          },
                          text: "Keluar",
                          fontSize: 18.sp,
                          backgroundColor: const Color.fromRGBO(204, 76, 78, 1),
                          height_percent: 0.08,
                          width_percent: 0.9,
                          radius: 20.dm,
                          icon: LucideIcons.power,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
