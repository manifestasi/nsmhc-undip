import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class MateriController extends GetxController {

  // Map<String, int> stage_map = {}
  var number_stage = 0.obs;
  // final AudioCache _audio = AudioCache();
  final AudioPlayer _audio = AudioPlayer();

  Map<int, RxInt> map_target_mandiri = {
    1 : 0.obs,
    2 : 0.obs,
    3 : 0.obs,
  };

  int get() => number_stage.value;
  int set(int value) => number_stage.value = value;

  RxInt set_target_mandiri(int index, RxInt value) => map_target_mandiri[index] = value; 

  /**
   * function untuk play audio
   */
  void playAudio(String asset)async{
      // await _audio.play(AssetSource(asset));
      
      await _audio.setSource(AssetSource(asset));
      await _audio.resume();
      log("iki wes play");
  }

  /**
   * function untuk stop audio
   */
  void stopAudio()async{
      await _audio.stop();
      log("iki wes stop");
  }

}