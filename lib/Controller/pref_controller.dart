import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Controller/content_controller.dart';
import 'package:nsmhc/Services/pref_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefController extends GetxController {
  var storedData = ''.obs;

  void loadData(String key) {
    String? data = SharedPreferencesService().getString(key);
    if (data != null) {
      storedData.value = data;
    }
  }

  dynamic getData(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(data);
  }

  Future<void> saveData(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', data['token']);
  }

  Future<bool> clearData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }

  Future<void> cekLogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var _contentController = Get.put(ContentController());

    if (token != null) {
      // await _contentController.saveTrack();
      Navigator.pushReplacementNamed(context, '/home_screen');
    } else {
      await prefs.clear();
      Navigator.pushReplacementNamed(context, '/welcome_screen');
    }
  }
}
