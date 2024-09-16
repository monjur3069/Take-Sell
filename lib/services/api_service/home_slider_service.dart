import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:take_sell/models/home_slider_model.dart';
import 'package:take_sell/services/api_service/common_function/common_snackbar_message.dart';
import 'package:take_sell/services/apis.dart';
import 'package:http/http.dart' as http;

class HomeSliderService{
  static Future<HomeSliderModel?> fetchHomeSliderData(BuildContext context) async {
    HomeSliderModel? homeSliderModel;
    final uri = Uri.parse(Apis.homeSlider);
    try {
      final response = await http.get(uri,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        homeSliderModel = HomeSliderModel.fromJson(map);
        return homeSliderModel;
      }
    } catch (error) {
      print("Error : $error");
    }
    CommonSnackBarMessage.errorMessage(text: 'Data fetch Failed', context: context);
    print('Data fetch Failed');
    return homeSliderModel;
  }
}