import 'dart:convert';

import 'package:take_sell/services/apis.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  static Future<bool> signUp(String name, String phone,
      String email, String password) async {
    try{
      var headers = {'Content-Type': 'application/json','Accept': 'application/json'};
      var url = Uri.parse(Apis.signUp);
      Map body = {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      };
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        await EasyLoading.showSuccess(data['message'] ?? '',dismissOnTap: false);
        return true;
      } else {
        print(response.statusCode);
        print(data['errors'].keys);
        var values= data['errors'].keys.toList();
        await EasyLoading.showError('$values \nare already taken' ?? '',dismissOnTap: false);
        return false;
      }
    }catch(e){
      print(e.toString());
    }
    await EasyLoading.showError('Failed',dismissOnTap: false);
    return false;
  }
}