import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nsmhc/Controller/pref_controller.dart';
import 'package:nsmhc/Model/profile_anak_model.dart';
import 'package:nsmhc/Model/profile_model.dart';

class ProfileController extends GetxController {
  String _baseUrl =
      "https://api.nsmhcundip.com";

  var prefController = Get.put(PrefController());

  RxBool? status = false.obs;
  RxString? status_foto = "".obs;
  RxBool? status_child = false.obs;
  ProfileModel? data_user;
  ProfileAnakModel? data_user_child;

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

  @override
  void onClose() {
    prefController.onClose();
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
   * Function untuk get data profile.
   * @manifestasi
   */

  Future<ProfileModel> getProfile(BuildContext context) async {
    final url_profile = Uri.parse("$_baseUrl/api/profile");
    var token = await prefController.getData("token");

    try {
      log("Mulai get profile");
      final response = await http.get(
        url_profile,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("status_code : ${response.statusCode}");
        log("status_code : ${json.decode(response.body)}");
        var data = json.decode(response.body);
        data_user = ProfileModel.fromJson(data);
      

        status!.value = true;
      } else {
        log("status_code : ${json.decode(response.body)}");
        status!.value = false;
      }
    } catch (e) {
      status!.value = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Kesalahan jaringan!",
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12.sp,
        ),
      )));
      Navigator.pushNamed(context, "/home_screen");
      log("Error Get Profile : ${e.toString()}");
    }
    return data_user!;
  }

  /**
   * 
   * Function untuk get data profile child.
   * @manifestasi
   */

  Future<ProfileAnakModel> getProfileChild(BuildContext context) async {
    final url_profile = Uri.parse("$_baseUrl/api/profile/child");
    var token = await prefController.getData("token");

    try {
      log("Mulai get profile child");
      final response = await http.get(
        url_profile,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("status_code : ${response.statusCode}");
        log("status_code : ${json.decode(response.body)}");
        var data = json.decode(response.body);
        data_user_child = ProfileAnakModel.fromJson(data);
       

        status_child!.value = true;
      } else {
        log("status_code : ${json.decode(response.body)}");
        status_child!.value = false;
      }
    } catch (e) {
      status_child!.value = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Kesalahan jaringan!",
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12.sp,
        ),
      )));
      Navigator.pop(context);
      log("Error Get Profile child : ${e.toString()}");
    }
    return data_user_child!;
  }

  /**
   * 
   * Function untuk handle update profile user.
   * @manifestasi
   */

  Future<bool> updateUser(File? foto) async {
    final urlProg = Uri.parse("$_baseUrl/api/profile");
    var token = await prefController.getData("token");

    try {
      var request = http.MultipartRequest('POST', urlProg);
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });

      // request.fields['nama'] = namaController.text;
      request.fields['usia'] = usiaController.text;
      request.fields['pendidikan_terakhir'] = pendidikan_controller.value;
      request.fields['pekerjaan_terakhir'] = pekerjaan_controller.value;
      request.fields['alamat'] = alamatController.text;
      request.fields['no_hp'] = hpController.text;

      if (foto != null) {
        request.files.add(await http.MultipartFile.fromPath('foto', foto.path));
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        log("Update sukses: ${response.body}");
        status_foto!.value = "sukses";
        return true;
      } else if(response.statusCode == 400) {
        Map<String, dynamic> out = jsonDecode(response.body);
        log("Gagal 400: ${response.body}");
        status_foto!.value = "gagal";
        return false;
      }
      else {
        Map<String, dynamic> out = jsonDecode(response.body);
        log("Gagal update: ${response.body}");
        status_foto!.value = "";
        return false;
      }
    } catch (e) {
      status_foto!.value = "";
      log("Terjadi kesalahan: $e");
      return false;
    }
  }

  /**
   * 
   * Function untuk handle update profile children.
   * @manifestasi
   */

  Future<bool> updateChild() async {
    final url_prog = Uri.parse("$_baseUrl/api/profile/child");
    bool? status;
    var token = await prefController.getData("token");

    try {
      final response = await http.post(url_prog,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode({
                "nama_lengkap": nama_anak_controller.text,
                "usia": int.parse(usia_anak_controller.text),
                "pendidikan_terakhir": pendidikan_anak_controller.value
              }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("status_code : ${response.statusCode}");
        log("status_code : ${json.decode(response.body)}");
        var data = json.decode(response.body);

        status = true;
      } else {
        log("status_code : ${json.decode(response.body)}");
        status = false;
      }
    } catch (e) {
      status = false;
      log("Error Update Child : ${e.toString()}");
    }
    return status;
  }
}
