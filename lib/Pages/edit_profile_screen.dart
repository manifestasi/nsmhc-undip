import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nsmhc/Controller/pref_controller.dart';
import 'package:nsmhc/Controller/profile_controller.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_icon_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  
   var _prefController = Get.put(PrefController());
  var _profileController = Get.put(ProfileController());

  // Future<void> get_profile()async{
  //   await _profileController.getProfile();
  // }

  // @override
  // void initState() {
  //   get_profile();
  //   super.initState();
  // }

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
                                "Edit Profil",
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
                            // (_profileController.status!.value == true)
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
                                : 
                                ClipOval(
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
                                        _profileController.data_user!.data!.name!,
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
                                        _profileController.data_user!.data!.email!,
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
                            Navigator.pushNamed(context, "/data_diri_screen");
                          },
                          text: "Data Diri",
                          fontSize: 18.sp,
                          height_percent: 0.08,
                          width_percent: 0.9,
                          radius: 20.dm,
                          icon: LucideIcons.pencil,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        RoundedIconButton(
                          context,
                          onTap: () {
                            Navigator.pushNamed(context, "/data_anak_screen");
                          },
                          text: "Data Anak",
                          fontSize: 18.sp,
                          height_percent: 0.08,
                          width_percent: 0.9,
                          radius: 20.dm,
                          icon: LucideIcons.pencil,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
