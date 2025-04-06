import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Controller/materi_controller.dart';
import 'package:nsmhc/Utils/home_clip_path.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Card/berserah_card.dart';
import 'package:nsmhc/Widgets/Card/item_body_card.dart';
import 'package:nsmhc/Widgets/Card/menu_target_mandiri.dart';
import 'package:nsmhc/Widgets/Card/relaksasi_card.dart';

class MateriScreen extends StatefulWidget {
  const MateriScreen({Key? key}) : super(key: key);

  @override
  _MateriScreenState createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  MateriController _materiController = Get.put(MateriController());

  final Map<String, RxBool> _map_selected = {
    "pusing": false.obs,
    "kesemutan": false.obs,
    "pundak_berat": false.obs,
    "mual": false.obs,
    "dada_sesak": false.obs,
    "tubuh_gemetar": false.obs,
    "nyeri_dada": false.obs,
    "lainnya": false.obs,
  };

  var _is_audio_played = false.obs;

  @override
  void dispose() {
    _materiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /**
         * kembalikan ke page -0
         */
        _materiController.number_stage.value = 0;
        /**
         * ketika kembali, audio berhenti
         */
        _is_audio_played.value = false;
        /**
         * kembalikan value radio button ke default
         *  */  
        _materiController.set_target_mandiri(1, 0.obs);
        _materiController.set_target_mandiri(2, 0.obs);
        _materiController.set_target_mandiri(3, 0.obs);
        return true;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: const Color.fromRGBO(255, 236, 207, 1),
            systemNavigationBarDividerColor:
                const Color.fromRGBO(185, 115, 69, 1),
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: const Color.fromRGBO(242, 162, 99, 1),
            body: Stack(
              children: [
                /**
                 * Background
                 *  */

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.2,
                            image: AssetImage("assets/images/bg_materi.png"))),
                  ),
                ),

                /**
                 * logo materi
                 * 
                 */

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.88,
                  child: SingleChildScrollView(
                    primary: true,
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.h, left: 20.w),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            (_materiController.number_stage.value == 9)
                                ? Text("")
                                : Container(
                                    height: 150.dm,
                                    width: 150.dm,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                TextUtilsData.materi_images()[
                                                    _materiController
                                                        .number_stage.value]),
                                            fit: BoxFit.cover)),
                                  ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                TextUtilsData.materi_title()[
                                    _materiController.number_stage.value],
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Obx(() => SizedBox(
                                // height:
                                // MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: (_materiController.number_stage.value ==
                                        5)
                                    ? Padding(
                                        padding: EdgeInsets.only(right: 20.w),
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: GridView.count(
                                              mainAxisSpacing: 20.dm,
                                              crossAxisCount: 4,
                                              semanticChildCount: 2,
                                              childAspectRatio: 0.7,
                                              crossAxisSpacing: 2.dm,
                                              children: [
                                                Obx(() => ItemBodyCard(context,
                                                    asset:
                                                        'assets/images/pusing_logo.png',
                                                    width: 50.dm,
                                                    height: 50.dm,
                                                    label: 'Pusing',
                                                    is_checked: _map_selected[
                                                        'pusing'])),
                                                Obx(() => ItemBodyCard(context,
                                                    asset:
                                                        'assets/images/kesemutan_logo.png',
                                                    width: 50.dm,
                                                    height: 50.dm,
                                                    label: 'Kesemutan',
                                                    is_checked: _map_selected[
                                                        'kesemutan'])),
                                                Obx(() => ItemBodyCard(context,
                                                    asset:
                                                        'assets/images/pundak_logo.png',
                                                    width: 50.dm,
                                                    height: 50.dm,
                                                    label: 'Pundak Berat',
                                                    is_checked: _map_selected[
                                                        'pundak_berat'])),
                                                Obx(() => ItemBodyCard(context,
                                                    asset:
                                                        'assets/images/mual_logo.png',
                                                    width: 50.dm,
                                                    height: 50.dm,
                                                    label: 'Mual',
                                                    is_checked:
                                                        _map_selected['mual'])),
                                                Obx(() => ItemBodyCard(context,
                                                    asset:
                                                        'assets/images/sesak_logo.png',
                                                    width: 50.dm,
                                                    height: 50.dm,
                                                    label: 'Dada Sesak',
                                                    is_checked: _map_selected[
                                                        'dada_sesak'])),
                                                Obx(() => ItemBodyCard(context,
                                                    asset:
                                                        'assets/images/gemetar_logo.png',
                                                    width: 50.dm,
                                                    height: 50.dm,
                                                    label: 'Tubuh Gemetar',
                                                    is_checked: _map_selected[
                                                        'tubuh_gemetar'])),
                                                Obx(() => ItemBodyCard(context,
                                                    asset:
                                                        'assets/images/nyeri_logo.png',
                                                    width: 50.dm,
                                                    height: 50.dm,
                                                    label: 'Nyeri Dada',
                                                    is_checked: _map_selected[
                                                        'nyeri_dada'])),
                                                Obx(() => ItemBodyCard(context,
                                                    asset:
                                                        'assets/images/lain_logo.png',
                                                    width: 50.dm,
                                                    height: 50.dm,
                                                    label: 'Lainnya',
                                                    is_checked: _map_selected[
                                                        'lainnya'])),
                                              ],
                                            )),
                                      )
                                    : (_materiController.number_stage.value ==
                                            7)
                                        ? Padding(
                                            padding:
                                                EdgeInsets.only(right: 20.w),
                                            child: RelaksasiCard(context),
                                          )
                                        : (_materiController
                                                    .number_stage.value ==
                                                8)
                                            ? Padding(
                                                padding: EdgeInsets.only(
                                                    right: 20.w),
                                                child: BerserahCard(context),
                                              )
                                            : (_materiController
                                                        .number_stage.value ==
                                                    9)
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 20.w),
                                                    child: Obx(
                                                      () => Column(
                                                        children: [
                                                          /**
                                                           * question target mandiri 1
                                                           * 
                                                           */
                                                          TargetMandiriCard(
                                                              context,
                                                              onTap1: (var p) {
                                                            _materiController
                                                                    .map_target_mandiri[
                                                                1] = p;
                                                            setState(() {
                                                              log("iki : ${_materiController.map_target_mandiri[1]}");
                                                            });
                                                          }, onTap2: (var p) {
                                                            _materiController
                                                                    .map_target_mandiri[
                                                                1] = p;
                                                            setState(() {
                                                              log("iki : ${_materiController.map_target_mandiri[1]}");
                                                            });
                                                          },
                                                              value_1: 1.obs,
                                                              value_2: 0.obs,
                                                              group_selected:
                                                                  _materiController
                                                                          .map_target_mandiri[
                                                                      1],
                                                              label: TextUtilsData
                                                                  .target_mandiri()[0]),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          /**
                                                           * question target mandiri 2
                                                           * 
                                                           */

                                                          TargetMandiriCard(
                                                              context,
                                                              onTap1: (var p) {
                                                            _materiController
                                                                    .map_target_mandiri[
                                                                2] = p;
                                                            setState(() {
                                                              log("iki : ${_materiController.map_target_mandiri[2]}");
                                                            });
                                                          }, onTap2: (var p) {
                                                            _materiController
                                                                    .map_target_mandiri[
                                                                2] = p;
                                                            setState(() {
                                                              log("iki : ${_materiController.map_target_mandiri[2]}");
                                                            });
                                                          },
                                                              value_1: 1.obs,
                                                              value_2: 0.obs,
                                                              group_selected:
                                                                  _materiController
                                                                          .map_target_mandiri[
                                                                      2],
                                                              label: TextUtilsData
                                                                  .target_mandiri()[1]),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          /**
                                                           * question target mandiri 3
                                                           * 
                                                           */
                                                          TargetMandiriCard(
                                                              context,
                                                              onTap1: (var p) {
                                                            _materiController
                                                                    .map_target_mandiri[
                                                                3] = p;
                                                            setState(() {
                                                              log("iki : ${_materiController.map_target_mandiri[3]}");
                                                            });
                                                          }, onTap2: (var p) {
                                                            _materiController
                                                                    .map_target_mandiri[
                                                                3] = p;
                                                            setState(() {
                                                              log("iki : ${_materiController.map_target_mandiri[3]}");
                                                            });
                                                          },
                                                              value_1: 1.obs,
                                                              value_2: 0.obs,
                                                              group_selected:
                                                                  _materiController
                                                                          .map_target_mandiri[
                                                                      3],
                                                              label: TextUtilsData
                                                                  .target_mandiri()[2]),
                                                        ],
                                                      ),
                                                    ))
                                                : Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 100.h),
                                                    child: Scrollbar(
                                                      thickness: 2.w,
                                                      interactive: true,
                                                      child: ListView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                              const ClampingScrollPhysics(),
                                                          primary: false,
                                                          itemCount: TextUtilsData
                                                                      .materi_stage()[
                                                                  _materiController
                                                                      .number_stage
                                                                      .value]
                                                              .length,
                                                          itemBuilder:
                                                              (_, index) =>
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top:
                                                                            5.h,
                                                                        bottom:
                                                                            10.h),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "${index + 1}.",
                                                                              style: TextStyle(fontFamily: "Poppins", fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.normal),
                                                                              textAlign: TextAlign.start,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10.w,
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.8,
                                                                              child: Text(
                                                                                TextUtilsData.materi_stage()[_materiController.number_stage.value][index],
                                                                                style: TextStyle(fontFamily: "Poppins", fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.normal),
                                                                                textAlign: TextAlign.start,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        (_materiController.number_stage.value == 4 &&
                                                                                index == 4)
                                                                            ? Padding(
                                                                                padding: EdgeInsets.only(top: 10.h),
                                                                                child: RichText(
                                                                                  text: TextSpan(
                                                                                    text: "Contoh Doa:",
                                                                                    style: TextStyle(color: Colors.white, fontSize: 18.sp, fontFamily: "Poppins", fontWeight: FontWeight.bold),
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: "\n\nYa Tuhanku, jadikanlah anak yang saya cintai, yang saya kandung selama 9 bulan menjadi pribadi yang dekat dengan-Mu, menyayangi orang tua dan bermanfaat untuk orang lain... Aamiin..",
                                                                                        style: TextStyle(color: Colors.white, fontSize: 16.sp, fontFamily: "Poppins", fontWeight: FontWeight.normal),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            : Text(""),
                                                                      ],
                                                                    ),
                                                                  )),
                                                    ),
                                                  ))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                /**
                 * 
                 * gradasi 
                 */

                ClipPath(
                  clipper: HomeClipPath1(),
                  child: Container(
                    height: 120.h,
                    width: double.maxFinite,
                    color: const Color.fromRGBO(255, 236, 207, 1),
                  ),
                ),

                /**
                 * title materi
                 * 
                 */

                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(
                      //   width: 5.w,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Container(
                          width: 250.w,
                          child: Text(
                            (_materiController.number_stage.value == 9)
                                ? TextUtilsData.materi_labels()[
                                    _materiController.number_stage.value]
                                : "${_materiController.number_stage.value + 1}. " +
                                    TextUtilsData.materi_labels()[
                                        _materiController.number_stage.value],
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(185, 115, 69, 1),
                            ),
                          ),
                        ),
                      ),

                      /**
                       * 
                       * Tombol Audio
                       */
                      Obx(() => Padding(
                            padding: EdgeInsets.only(right: 30.w),
                            child: InkWell(
                              onTap: () {
                                _is_audio_played.value =
                                    !_is_audio_played.value;
                                (_is_audio_played.value)
                                    ? _materiController.playAudio(
                                        TextUtilsData.audio_path()[
                                            _materiController
                                                .number_stage.value])
                                    : _materiController.stopAudio();
                              },
                              // onTap: ()=>  _materiController.playAudio("audio/kartu_tidak_terdaftar.mp3"),
                              child: Container(
                                height: 40.dm,
                                width: 40.dm,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(185, 115, 69, 1),
                                      blurRadius: 1.0,
                                      spreadRadius: 0.02,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30.dm),
                                  color: const Color.fromRGBO(242, 162, 99, 1),
                                ),
                                child: Icon(
                                  (_is_audio_played.value)
                                      ? Icons.pause : Icons.volume_up_sharp,
                                  color: Colors.white,
                                  size: 20.dm,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      /**
                         * Button Mulai
                         */
                      Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: RoundedButton(
                      context,
                      onTap: () {
                        // Navigator.pushNamed(context, "/login_screen");
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.dm)),
                            ),
                            builder: (context) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.dm),
                                  topRight: Radius.circular(20.dm),
                                )),
                                child: Column(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              text: (_materiController
                                                          .number_stage.value ==
                                                      9)
                                                  ? ""
                                                  : "Pertanyaan\n",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 18.sp,
                                                  color: const Color.fromRGBO(
                                                      141, 77, 36, 1),
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  text: TextUtilsData
                                                          .materi_question()[
                                                      _materiController
                                                          .number_stage.value],
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 16.sp,
                                                      color:
                                                          const Color.fromRGBO(
                                                              141, 77, 36, 1),
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    /**
                         * Button Mulai
                         */
                                    RoundedButton(
                                      context,
                                      onTap: () {
                                        // _materiController.set(
                                        //     _materiController.number_stage.value +
                                        //         1);

                                        _materiController.number_stage.value++;
                                        _is_audio_played.value = false;
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                        // Navigator.pushNamed(
                                        //     context, "/login_screen");
                                      },
                                      text: (_materiController
                                                  .number_stage.value ==
                                              9)
                                          ? "Selesai"
                                          : "Lanjut",
                                      fontSize: 18.sp,
                                      height_percent: 0.08,
                                      width_percent: 0.9,
                                      radius: 20.dm,
                                    )
                                  ],
                                )));
                      },
                      text: "Lanjut",
                      fontSize: 18.sp,
                      is_border: true,
                      border_color: Colors.white,
                      color: const Color.fromRGBO(242, 162, 99, 1),
                      height_percent: 0.08,
                      width_percent: 0.9,
                      radius: 20.dm,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
