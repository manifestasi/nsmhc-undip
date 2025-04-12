import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nsmhc/Controller/pref_controller.dart';

class AuthController extends GetxController {
  String _baseUrl =
      "https://api.nsmhcundip.com";

  /**
   * text editing controller
   * 
   */
  var emailController = TextEditingController();
  var namaController = TextEditingController();
  var usiaController = TextEditingController();
  var passController = TextEditingController();
  var confnameController = TextEditingController();
  var alamatController = TextEditingController();
  var hpController = TextEditingController();
  var pendidikan_controller = "".obs;
  var pekerjaan_controller = "".obs;

  var nama_anak_controller = TextEditingController();
  var usia_anak_controller = TextEditingController();
  var pendidikan_anak_controller = "".obs;

  /**
   * shared preferences
   */

  var prefController = Get.put(PrefController());


    @override
    void onClose() {
      emailController.dispose();
      namaController.dispose();
      usiaController.dispose();
      passController.dispose();
      confnameController.dispose();
      alamatController.dispose();
      hpController.dispose();
      super.onClose();
    }  

  /**
   * 
   * Function untuk handle registrasi akun.
   * @manifestasi
   */

  Future<bool> register() async {
    final url_register = Uri.parse("$_baseUrl/api/register");
    bool? status;

    try {
      final response = await http.post(url_register,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "email": emailController.text,
            "password": passController.text,
            "password_confirmation": confnameController.text,
            "nama_lengkap_pengguna": namaController.text,
            "usia_pengguna": int.parse(usiaController.text),
            "pendidikan_terakhir_pengguna": pendidikan_controller.value,
            "pekerjaan_terakhir_pengguna": pekerjaan_controller.value,
            "alamat": alamatController.text,
            "no_hp": hpController.text,
            "nama_lengkap_anak": nama_anak_controller.text,
            "usia_anak": int.parse(usia_anak_controller.text),
            "pendidikan_terakhir_anak": pendidikan_anak_controller.value
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("status_code : ${response.statusCode}");
        status = true;
      } else {
        log("status_code : ${response.statusCode}");
        status = false;
      }
    } catch (e) {
      status = false;
      log("Error Auth : ${e.toString()}");
    }
    return status;
  }

  /**
   * 
   * Function untuk handle login akun.
   * @manifestasi
   */

  Future<bool> login() async {
    final url_login = Uri.parse("$_baseUrl/api/login-user");
    bool? status;

    try {
      final response = await http.post(url_login,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "email": emailController.text,
            "password": passController.text,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("status_code : ${response.statusCode}");
        log("status_code : ${json.decode(response.body)}");
        var data = json.decode(response.body);
        /**
         * simpan data login ke shared preferences.
         */
        await prefController.saveData(data);
        status = true;

      } else {
        log("status_code : ${json.decode(response.body)}");
        status = false;
      }
    } catch (e) {
      status = false;
      log("Error Auth : ${e.toString()}");
    }
    return status;
  }
}
