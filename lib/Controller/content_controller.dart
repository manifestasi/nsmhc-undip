import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nsmhc/Controller/pref_controller.dart';

class ContentController extends GetxController {

  String _baseUrl =
      "https://api.nsmhcundip.com";
  
  var prefController = Get.put(PrefController());

  RxBool? is_tracked = false.obs;

    /**
   * 
   * Function untuk handle save progress.
   * @manifestasi
   */

  Future<bool> saveProgress(int contentId) async {
    final url_prog = Uri.parse("$_baseUrl/api/content/$contentId");
    bool? status;
    var token = await prefController.getData("token");

    try {
      final response = await http.post(url_prog,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            
            },
          );
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
      log("Error Progress : ${e.toString()}");
    }
    return status;
  }

    /**
   * 
   * Function untuk handle reaction progress.
   * @manifestasi
   */

  Future<bool> saveReaction(List<int> items) async {
    final url_prog = Uri.parse("$_baseUrl/api/reaction");
    bool? status;
    var token = await prefController.getData("token");

    try {
      final response = await http.post(url_prog,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            
            },
            body: jsonEncode({
              "reactions_id": items
            })
          );
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
      log("Error React : ${e.toString()}");
    }
    return status;
  }

    /**
   * 
   * Function untuk handle qa progress.
   * @manifestasi
   */

  Future<bool> saveQA(List<Map<String, dynamic>> items) async {
    final url_prog = Uri.parse("$_baseUrl/api/question/answer");
    bool? status;
    var token = await prefController.getData("token");

    try {
      final response = await http.post(url_prog,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            
            },
            body: jsonEncode(items)
          );
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
      log("Error QA : ${e.toString()}");
    }
    return status;
  }

    /**
   * 
   * Function untuk handle track progress.
   * @manifestasi
   */

  Future<bool> saveTrack() async {
    final url_prog = Uri.parse("$_baseUrl/api/track");
    bool? status;
    var token = await prefController.getData("token");

    try {
      log("send track");
      final response = await http.post(url_prog,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            },
          );
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
      log("Error Track : ${e.toString()}");
    }
    return status;
  }


}