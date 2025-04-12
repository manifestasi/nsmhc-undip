import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Controller/content_controller.dart';
import 'package:nsmhc/Controller/materi_controller.dart';
import 'package:nsmhc/Controller/pref_controller.dart';
import 'package:nsmhc/Utils/home_clip_path.dart';
import 'package:nsmhc/Utils/text_utils.dart';
import 'package:nsmhc/Widgets/Alerts/apresiasi_pop.dart';
import 'package:nsmhc/Widgets/Alerts/dialog_pop.dart';
import 'package:nsmhc/Widgets/Buttons/rounded_button.dart';
import 'package:nsmhc/Widgets/Card/berserah_card.dart';
import 'package:nsmhc/Widgets/Card/item_body_card.dart';
import 'package:nsmhc/Widgets/Card/menu_target_mandiri.dart';
import 'package:nsmhc/Widgets/Card/persiapan_card.dart';
import 'package:nsmhc/Widgets/Card/relaksasi_card.dart';

class MateriScreen extends StatefulWidget {
  const MateriScreen({Key? key}) : super(key: key);

  @override
  _MateriScreenState createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  MateriController _materiController = Get.put(MateriController());
  var _contentController = Get.put(ContentController());
  var _prefController = Get.put(PrefController());

  final Map<String, RxBool> _map_selected = {
    "pusing": false.obs,
    "dada_sesak": false.obs,
    "nyeri_dada": false.obs,
    "pundak_berat": false.obs,
    "kesemutan": false.obs,
    "mual": false.obs,
    "tubuh_gemetar": false.obs,
    "lainnya": false.obs,
  };

  var _is_audio_played = false.obs;
  RxBool? is_pressed = false.obs;
  RxBool? checked = false.obs;
  RxBool? is_last = false.obs;
  RxList<RxBool> selected_mandiri = [false.obs, false.obs, false.obs].obs;

  @override
  void initState() {
    if (selected_mandiri[0].value == false) {
      _materiController.playAudio(
          TextUtilsData.audio_path()[_materiController.number_stage.value]);
      log("iki dudu sih haaaah");
    }

    super.initState();
  }

  // @override
  // void dispose() {
  //   _materiController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /**
         * tetap di stage terkahir.
         */
        // _materiController.number_stage.value;
        /**
         * ketika kembali, audio berhenti
         */

        _materiController.stopAudio();

        // _is_audio_played.value = false;
        /**
         * kembalikan value radio button ke default
         *  */
        _materiController.set_target_mandiri(1, 2.obs);
        _materiController.set_target_mandiri(2, 2.obs);
        _materiController.set_target_mandiri(3, 2.obs);
        await _prefController
            .saveStage(_materiController.number_stage.value)
            .then((value) {
          Navigator.pushReplacementNamed(context, "/home_screen");
        });

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
                            /**
                             * pada halaman target mandiri tidak ada image
                             */
                            (_materiController.number_stage.value == 10)
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

                            /**
                             * layout title khusus untuk tahpan persiapan latihan;
                             */
                            (_materiController.number_stage.value == 0)
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(right: 10.w, top: 10.h),
                                    child: persiapanCard(context,
                                        height: 0.2,
                                        width: 0.9,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.dm),
                                          child: Text(
                                            TextUtilsData.materi_title()[
                                                _materiController
                                                    .number_stage.value],
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                          ),
                                        )),
                                  )
                                :
                                /**
                                 * layout untuk tahapan selain persiapan latihan. 
                                 *
                                 */
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                                child:
                                    /**
                                 * halaman persiapan latihan.
                                 */
                                    (_materiController.number_stage.value == 0)
                                        ? SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.w),
                                              child: ListView.builder(
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  itemCount: TextUtilsData
                                                          .persiapan_stage()
                                                      .length,
                                                  itemBuilder: (_, index) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.h),
                                                      child:
                                                          persiapanCard(context,
                                                              height: 0.2,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  255,
                                                                  236,
                                                                  206,
                                                                  1),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 5
                                                                            .h),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 10
                                                                            .w),
                                                                    Text(
                                                                      "${index + 1}. ",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Poppins",
                                                                          fontSize: 16
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          color: const Color.fromRGBO(
                                                                              185,
                                                                              115,
                                                                              69,
                                                                              1)),
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.7,
                                                                      child:
                                                                          Text(
                                                                        TextUtilsData.persiapan_stage()[
                                                                            index],
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Poppins",
                                                                            fontSize: 16
                                                                                .sp,
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color: const Color.fromRGBO(
                                                                                185,
                                                                                115,
                                                                                69,
                                                                                1)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                    );
                                                  }),
                                            ),
                                          )

                                        /**
                                       * halaman body scan
                                       * 
                                       */

                                        : (_materiController
                                                    .number_stage.value ==
                                                6)
                                            ? Padding(
                                                padding: EdgeInsets.only(
                                                    right: 20.w),
                                                child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                    width:
                                                        MediaQuery.of(context)
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
                                                        Obx(() => ItemBodyCard(
                                                            context,
                                                            asset:
                                                                'assets/images/pusing_logo.png',
                                                            width: 50.dm,
                                                            height: 50.dm,
                                                            label: 'Pusing',
                                                            is_checked:
                                                                _map_selected[
                                                                    'pusing'])),
                                                        Obx(() => ItemBodyCard(
                                                            context,
                                                            asset:
                                                                'assets/images/sesak_logo.png',
                                                            width: 50.dm,
                                                            height: 50.dm,
                                                            label: 'Dada Sesak',
                                                            is_checked:
                                                                _map_selected[
                                                                    'dada_sesak'])),
                                                        Obx(() => ItemBodyCard(
                                                            context,
                                                            asset:
                                                                'assets/images/nyeri_logo.png',
                                                            width: 50.dm,
                                                            height: 50.dm,
                                                            label: 'Nyeri Dada',
                                                            is_checked:
                                                                _map_selected[
                                                                    'nyeri_dada'])),
                                                        Obx(() => ItemBodyCard(
                                                            context,
                                                            asset:
                                                                'assets/images/pundak_logo.png',
                                                            width: 50.dm,
                                                            height: 50.dm,
                                                            label:
                                                                'Pundak Berat',
                                                            is_checked:
                                                                _map_selected[
                                                                    'pundak_berat'])),
                                                        Obx(() => ItemBodyCard(
                                                            context,
                                                            asset:
                                                                'assets/images/kesemutan_logo.png',
                                                            width: 50.dm,
                                                            height: 50.dm,
                                                            label: 'Kesemutan',
                                                            is_checked:
                                                                _map_selected[
                                                                    'kesemutan'])),
                                                        Obx(() => ItemBodyCard(
                                                            context,
                                                            asset:
                                                                'assets/images/mual_logo.png',
                                                            width: 50.dm,
                                                            height: 50.dm,
                                                            label: 'Mual',
                                                            is_checked:
                                                                _map_selected[
                                                                    'mual'])),
                                                        Obx(() => ItemBodyCard(
                                                            context,
                                                            asset:
                                                                'assets/images/gemetar_logo.png',
                                                            width: 50.dm,
                                                            height: 50.dm,
                                                            label:
                                                                'Tubuh Gemetar',
                                                            is_checked:
                                                                _map_selected[
                                                                    'tubuh_gemetar'])),
                                                        Obx(() => ItemBodyCard(
                                                            context,
                                                            asset:
                                                                'assets/images/lain_logo.png',
                                                            width: 50.dm,
                                                            height: 50.dm,
                                                            label: 'Lainnya',
                                                            is_checked:
                                                                _map_selected[
                                                                    'lainnya'])),
                                                      ],
                                                    )),
                                              )
                                            /**
                                           * 
                                           * halaman relaksasi.
                                           */
                                            : (_materiController
                                                        .number_stage.value ==
                                                    8)
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 20.w),
                                                    child:
                                                        RelaksasiCard(context),
                                                  )

                                                /**
                                               * halaman berserah diri;
                                               */
                                                : (_materiController
                                                            .number_stage
                                                            .value ==
                                                        9)
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20.w),
                                                        child: BerserahCard(
                                                            context),
                                                      )
                                                    /**
                                                   * halaman target mandiri.
                                                   * 
                                                   */
                                                    : (_materiController
                                                                .number_stage
                                                                .value ==
                                                            10)
                                                        ? Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        20.w),
                                                            child: Obx(
                                                              () => Column(
                                                                children: [
                                                                  /**
                                                           * question target mandiri 1
                                                           * 
                                                           */
                                                                  TargetMandiriCard(
                                                                      context,
                                                                      onTap1:
                                                                          (var p) {
                                                                    // selected_mandiri!
                                                                    //     .value++;
                                                                    selected_mandiri[0]
                                                                            .value =
                                                                        true;

                                                                    _materiController
                                                                            .map_target_mandiri[
                                                                        1] = p;
                                                                    setState(
                                                                        () {
                                                                      log("iki : ${_materiController.map_target_mandiri[1]}");
                                                                    });
                                                                  }, onTap2:
                                                                          (var p) {
                                                                    selected_mandiri[0]
                                                                            .value =
                                                                        true;

                                                                    _materiController
                                                                            .map_target_mandiri[
                                                                        1] = p;
                                                                    setState(
                                                                        () {
                                                                      log("iki : ${_materiController.map_target_mandiri[1]}");
                                                                    });
                                                                  },
                                                                      value_1:
                                                                          1.obs,
                                                                      value_2:
                                                                          0.obs,
                                                                      group_selected:
                                                                          _materiController.map_target_mandiri[
                                                                              1],
                                                                      label: TextUtilsData
                                                                          .target_mandiri()[0]),
                                                                  SizedBox(
                                                                    height:
                                                                        10.h,
                                                                  ),
                                                                  /**
                                                           * question target mandiri 2
                                                           * 
                                                           */

                                                                  TargetMandiriCard(
                                                                      context,
                                                                      onTap1:
                                                                          (var p) {
                                                                    // selected_mandiri!
                                                                    //     .value++;

                                                                    selected_mandiri[1]
                                                                            .value =
                                                                        true;

                                                                    _materiController
                                                                            .map_target_mandiri[
                                                                        2] = p;
                                                                    setState(
                                                                        () {
                                                                      log("iki : ${_materiController.map_target_mandiri[2]}");
                                                                    });
                                                                  }, onTap2:
                                                                          (var p) {
                                                                    selected_mandiri[1]
                                                                            .value =
                                                                        true;

                                                                    _materiController
                                                                            .map_target_mandiri[
                                                                        2] = p;
                                                                    setState(
                                                                        () {
                                                                      log("iki : ${_materiController.map_target_mandiri[2]}");
                                                                    });
                                                                  },
                                                                      value_1:
                                                                          1.obs,
                                                                      value_2:
                                                                          0.obs,
                                                                      group_selected:
                                                                          _materiController.map_target_mandiri[
                                                                              2],
                                                                      label: TextUtilsData
                                                                          .target_mandiri()[1]),
                                                                  SizedBox(
                                                                    height:
                                                                        10.h,
                                                                  ),
                                                                  /**
                                                           * question target mandiri 3
                                                           * 
                                                           */
                                                                  TargetMandiriCard(
                                                                      context,
                                                                      onTap1:
                                                                          (var p) {
                                                                    // selected_mandiri!
                                                                    //     .value++;

                                                                    selected_mandiri[2]
                                                                            .value =
                                                                        true;

                                                                    _materiController
                                                                            .map_target_mandiri[
                                                                        3] = p;
                                                                    setState(
                                                                        () {
                                                                      log("iki : ${_materiController.map_target_mandiri[3]}");
                                                                    });
                                                                  }, onTap2:
                                                                          (var p) {
                                                                    selected_mandiri[2]
                                                                            .value =
                                                                        true;

                                                                    _materiController
                                                                            .map_target_mandiri[
                                                                        3] = p;
                                                                    setState(
                                                                        () {
                                                                      log("iki : ${_materiController.map_target_mandiri[3]}");
                                                                    });
                                                                  },
                                                                      value_1:
                                                                          1.obs,
                                                                      value_2:
                                                                          0.obs,
                                                                      group_selected:
                                                                          _materiController.map_target_mandiri[
                                                                              3],
                                                                      label: TextUtilsData
                                                                          .target_mandiri()[2]),
                                                                ],
                                                              ),
                                                            ))
                                                        : Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        100.h),
                                                            child: Scrollbar(
                                                              thickness: 2.w,
                                                              interactive: true,
                                                              child: ListView
                                                                  .builder(
                                                                      shrinkWrap:
                                                                          true,
                                                                      physics:
                                                                          const ClampingScrollPhysics(),
                                                                      primary:
                                                                          false,
                                                                      itemCount: TextUtilsData.materi_stage()[_materiController
                                                                              .number_stage
                                                                              .value]
                                                                          .length,
                                                                      itemBuilder: (_,
                                                                              index) =>
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 5.h, bottom: 10.h),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                (_materiController.number_stage.value == 6 && index == 4)
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
                            (_materiController.number_stage.value == 10 ||
                                    _materiController.number_stage.value == 0)
                                ? TextUtilsData.materi_labels()[
                                    _materiController.number_stage.value]
                                : "${_materiController.number_stage.value}. " +
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
                                    ? _materiController.stopAudio()
                                    : _materiController.playAudio(
                                        TextUtilsData.audio_path()[
                                            _materiController
                                                .number_stage.value]);
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
                                      ? Icons.pause
                                      : Icons.volume_up_sharp,
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

                        /**
                         * 
                         * cek body scan
                         */

                        List<int> items = [];
                        var menu_list = _map_selected.entries.toList();

                        for (int i = 0; i < menu_list.length; i++) {
                          if (menu_list[i].value.value == true) {
                            items.add(i + 1);
                            checked!.value = true;
                          }
                        }

                        /**
                         * cek QA
                         * jika ada salah satu pertanyaan yang 
                         * tidak dijawab, maka akan muncul dialog pop.
                         *  */

                        List<Map<String, dynamic>> items_qa = [];

                        for (int i = 1;
                            i <= _materiController.map_target_mandiri.length;
                            i++) {
                          log("data -> ${_materiController.map_target_mandiri[i]!.value}");

                          if (_materiController.map_target_mandiri[i]!.value ==
                              2) {
                            // selected_mandiri!.value = 0;

                            log("ada yang belum terpilih");
                          } else {
                            // selected_mandiri!.value++;
                            items_qa.add({
                              "question": TextUtilsData.target_mandiri()[i - 1],
                              "answer": (_materiController
                                          .map_target_mandiri[i]!.value ==
                                      1)
                                  ? "Sudah"
                                  : "Belum"
                            });
                          }
                        }
                        log("selected_mandiri ${selected_mandiri}");
                        /**
                         * saat di stage body scan dan tidak memilih
                         * maka akan muncul dialog pop-up
                         */

                        (_materiController.number_stage.value == 6 &&
                                checked!.value == false)
                            ? DialogPop(context,
                                is_good: false,
                                height: 0.08,
                                label: "Silahkan pilih minimal satu!")
                            : (_materiController.number_stage.value == 10 &&
                                    (selected_mandiri[0].value == false ||
                                        selected_mandiri[1].value == false ||
                                        selected_mandiri[2].value == false))
                                ? DialogPop(context,
                                    is_good: false,
                                    height: 0.1,
                                    label:
                                        "Pastikan telah menjawab semua pertanyaan!")
                                : showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20.dm)),
                                    ),
                                    builder: (context) => Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                child: RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                      text: (_materiController
                                                                  .number_stage
                                                                  .value ==
                                                              10)
                                                          ? ""
                                                          : "Pertanyaan\n",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18.sp,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              141, 77, 36, 1),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      children: [
                                                        TextSpan(
                                                          text: TextUtilsData
                                                                  .materi_question()[
                                                              _materiController
                                                                  .number_stage
                                                                  .value],
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 16.sp,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  141,
                                                                  77,
                                                                  36,
                                                                  1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                            /**
                         * Button Mulai
                         */
                                            Obx(() {
                                              return (is_pressed!.value)
                                                  ? const CircularProgressIndicator(
                                                      color: Color.fromRGBO(
                                                          242, 162, 99, 1),
                                                    )
                                                  : RoundedButton(
                                                      context,
                                                      onTap: () async {
                                                        /**
                                                 * matikan lalu mainkan
                                                 */
                                                        _materiController
                                                            .stopAudio();

                                                        // _is_audio_played.value = false;
                                                        is_pressed!.value =
                                                            true;
                                                        log("Number stage ${_materiController.number_stage.value}");

                                                        if (_materiController
                                                                    .number_stage
                                                                    .value ==
                                                                7 &&
                                                            checked!.value ==
                                                                false) {
                                                          _materiController
                                                              .number_stage
                                                              .value = 6;
                                                        } else {
                                                          _materiController
                                                              .number_stage
                                                              .value++;
                                                        }

                                                        await _prefController
                                                            .saveStage(
                                                                _materiController
                                                                        .number_stage
                                                                        .value +
                                                                    1);

                                                        /**
                                                 * Save Body Scan Reaction
                                                 * 
                                                 */

                                                        if (_materiController
                                                                .number_stage
                                                                .value ==
                                                            7) {
                                                          /**
                                                   * 
                                                   * cek apakah user sudah memilih min. 1 item
                                                   */

                                                          if (checked!.value) {
                                                            await _contentController
                                                                .saveReaction(
                                                                    items)
                                                                .then(
                                                                    (value) async {
                                                              var contentId =
                                                                  _materiController
                                                                          .number_stage
                                                                          .value -
                                                                      1;

                                                              if (value) {
                                                                await _contentController
                                                                    .saveProgress(
                                                                        contentId)
                                                                    .then(
                                                                        (value) async {
                                                                  setState(() {
                                                                    Navigator.pop(
                                                                        context);
                                                                  });
                                                                  is_pressed!
                                                                          .value =
                                                                      false;
                                                                  if (value) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(SnackBar(
                                                                            content: Text(
                                                                      "Progress Tersimpan",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontSize:
                                                                            12.sp,
                                                                      ),
                                                                    )));
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(SnackBar(
                                                                            content: Text(
                                                                      "Progress tidak tersimpan! Periksa Koneksi Anda.",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontSize:
                                                                            12.sp,
                                                                      ),
                                                                    )));

                                                                    _materiController
                                                                        .number_stage
                                                                        .value--;
                                                                    // await _prefController
                                                                    //     .saveStage(_materiController
                                                                    //       .number_stage
                                                                    //       .value + 1).then((value) {
                                                                    //   Navigator.pushReplacementNamed(
                                                                    //       context,
                                                                    //       "/home_screen");
                                                                    // });
                                                                    Navigator.pushReplacementNamed(
                                                                        context,
                                                                        "/home_screen");
                                                                  }
                                                                });
                                                              } else {
                                                                _materiController
                                                                    .number_stage
                                                                    .value--;
                                                                // await _prefController
                                                                //     .saveStage(
                                                                //       _materiController
                                                                //           .number_stage
                                                                //           .value + 1).then((value) {

                                                                // });
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        SnackBar(
                                                                            content:
                                                                                Text(
                                                                  "Progress tidak tersimpan! Periksa Koneksi Anda.",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        12.sp,
                                                                  ),
                                                                )));
                                                                Navigator
                                                                    .pushReplacementNamed(
                                                                        context,
                                                                        "/home_screen");
                                                              }
                                                            });
                                                          }
                                                        } else if (_materiController
                                                                .number_stage
                                                                .value >=
                                                            11) {
                                                          /**
                                                   * save QA 
                                                   *  */

                                                          if (selected_mandiri[0].value == true &&
                                                              selected_mandiri[
                                                                          1]
                                                                      .value ==
                                                                  true &&
                                                              selected_mandiri[
                                                                          2]
                                                                      .value ==
                                                                  true) {
                                                            // log("kudune iki stop ii");
                                                            // _materiController.stopAudio();
                                                            is_last!.value =
                                                                true;

                                                            /**
                                                     * simpan progress QA (stage terakhir);
                                                     */
                                                            await _contentController
                                                                .saveQA(
                                                                    items_qa)
                                                                .then(
                                                                    (value) async {
                                                              if (value) {
                                                                // Navigator.pop(context);
                                                                /**
                                                       * kembalikan value radio button ke default
                                                       *  */
                                                                _materiController
                                                                    .set_target_mandiri(
                                                                        1,
                                                                        2.obs);
                                                                _materiController
                                                                    .set_target_mandiri(
                                                                        2,
                                                                        2.obs);
                                                                _materiController
                                                                    .set_target_mandiri(
                                                                        3,
                                                                        2.obs);

                                                                selected_mandiri[
                                                                            0]
                                                                        .value =
                                                                    false;
                                                                selected_mandiri[
                                                                            1]
                                                                        .value =
                                                                    false;
                                                                selected_mandiri[
                                                                            2]
                                                                        .value =
                                                                    false;

                                                                // _materiController
                                                                //     .number_stage
                                                                //     .value = 12;
                                                                ApresiasiPop(
                                                                    context);
                                                              } else {
                                                                _materiController
                                                                    .number_stage
                                                                    .value = 10;

                                                                // await _prefController
                                                                //     .saveStage(
                                                                //       _materiController
                                                                //           .number_stage
                                                                //           .value + 1).then((value) {

                                                                //   });

                                                                is_pressed!
                                                                        .value =
                                                                    false;
                                                                Navigator.pushReplacementNamed(
                                                                        context,
                                                                        "/home_screen")
                                                                    .then(
                                                                        (value) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          SnackBar(
                                                                              content: Text(
                                                                    "Progress Target Mandiri tidak tersimpan!",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontSize:
                                                                          12.sp,
                                                                    ),
                                                                  )));
                                                                });
                                                              }

                                                              log("QA | $value");
                                                              _materiController
                                                                  .number_stage
                                                                  .value = 0;
                                                            });
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                            is_pressed!.value =
                                                                false;

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text(
                                                              "Maaf, Silahkan jawab semua pertanyaan!",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontSize: 12.sp,
                                                              ),
                                                            )));
                                                          }
                                                        } else if (_materiController
                                                                .number_stage
                                                                .value ==
                                                            1) {
                                                          setState(() {
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                          _materiController
                                                              .number_stage
                                                              .value = 1;
                                                          is_pressed!.value =
                                                              false;

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                                      content:
                                                                          Text(
                                                            "Mari Mulai Sekarang!",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 12.sp,
                                                            ),
                                                          )));
                                                        } else {
                                                          /**
                                                   * save progress materi
                                                   *  */

                                                          var contentId =
                                                              _materiController
                                                                      .number_stage
                                                                      .value -
                                                                  1;
                                                          await _contentController
                                                              .saveProgress(
                                                                  contentId)
                                                              .then(
                                                                  (value) async {
                                                            setState(() {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                            is_pressed!.value =
                                                                false;

                                                            if (value) {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text(
                                                                "Progress Tersimpan",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontSize:
                                                                      12.sp,
                                                                ),
                                                              )));
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text(
                                                                "Progress tidak tersimpan!",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontSize:
                                                                      12.sp,
                                                                ),
                                                              )));

                                                              _materiController
                                                                  .number_stage
                                                                  .value--;

                                                              //   await _prefController
                                                              // .saveStage(
                                                              //     _materiController
                                                              //         .number_stage
                                                              //         .value + 1).then((value) {

                                                              //         });
                                                              Navigator
                                                                  .pushReplacementNamed(
                                                                      context,
                                                                      "/home_screen");
                                                            }
                                                          });
                                                        }

                                                        if (_materiController
                                                                    .number_stage
                                                                    .value <
                                                                11 &&
                                                            is_last!.value ==
                                                                false) {
                                                          log("last : ${is_last!.value}");
                                                          _materiController.playAudio(
                                                              TextUtilsData
                                                                      .audio_path()[
                                                                  _materiController
                                                                      .number_stage
                                                                      .value]);
                                                        }

                                                        // await _prefController
                                                        //     .saveStage(
                                                        //         _materiController
                                                        //             .number_stage
                                                        //             .value + 1);
                                                      },
                                                      text: (_materiController
                                                                  .number_stage
                                                                  .value ==
                                                              10)
                                                          ? "Selesai"
                                                          : "Lanjut",
                                                      fontSize: 18.sp,
                                                      height_percent: 0.08,
                                                      width_percent: 0.9,
                                                      radius: 20.dm,
                                                    );
                                            })
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
