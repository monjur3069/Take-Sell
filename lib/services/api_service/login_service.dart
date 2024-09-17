import 'dart:convert';

import 'package:take_sell/services/apis.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<bool> login(String email, String password) async {
    try {
      var url = Uri.parse(Apis.login);
      var body = jsonEncode({"email": email, "password": password});
      var response = await http.post(url,
          body: body,
          encoding: Encoding.getByName("utf-8"),
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8'
          });
      var decodedData = jsonDecode(response.body);
      if (decodedData['message'] == "Invalid Credentials!") {
        await EasyLoading.showSuccess("Invalid Email Or Password.");
        return false;
      }else if (decodedData['message'] == "User Login Successfully!") {
        /*Map<String, dynamic> userInfo = {
          'user_id': decodedData['data']['id'] ?? '',
          'user_type': decodedData['data']['name'] ?? '',
          'user_name': decodedData['data']['username'] ?? '',
          'user_phn': decodedData['data']['phone'] ?? '',
          'user_mail': decodedData['data']['email'] ?? '',
          'user_pass': password,
          'user_address': decodedData['data']['address'] ?? '',
          'user_img': decodedData['data']['profile_image'],
        };
        await AppInfo.box.put('userInfo', userInfo);
        await AppInfo.box.put('token', decodedData['token']);*/
        await EasyLoading.showSuccess("Login Successful");
        return true;
      }
    } catch (e) {
      print("Error : $e");
    }
    await EasyLoading.showError("Failed.!!");
    return false;
  }
}