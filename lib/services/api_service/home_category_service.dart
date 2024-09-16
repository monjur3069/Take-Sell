import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:take_sell/models/home_category_model.dart';
import 'package:take_sell/services/api_service/common_function/common_snackbar_message.dart';
import 'package:take_sell/services/apis.dart';

class HomeCategoryService{
  static Future<HomeCategoryModel?> fetchHomeCategoryData(BuildContext context) async {
    HomeCategoryModel? homeCategoryModel;
    final uri = Uri.parse(Apis.homeCategory);
    try {
      final response = await http.get(uri,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        homeCategoryModel = HomeCategoryModel.fromJson(map);
        return homeCategoryModel;
      }
    } catch (error) {
      print("Error : $error");
    }
    CommonSnackBarMessage.errorMessage(text: 'Data fetch Failed', context: context);
    print('Data fetch Failed');
    return homeCategoryModel;
  }
}