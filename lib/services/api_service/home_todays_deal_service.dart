import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:take_sell/models/home_todays_deal_model.dart';
import 'package:take_sell/services/api_service/common_function/common_snackbar_message.dart';
import 'package:take_sell/services/apis.dart';

class HomeTodaysDealService{
  static Future<HomeTodaysDealModel?> fetchHomeTodaysDealData(BuildContext context) async {
    HomeTodaysDealModel? homeTodaysDealModel;
    final uri = Uri.parse(Apis.homeTodaysDeal);
    try {
      final response = await http.get(uri,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        homeTodaysDealModel = HomeTodaysDealModel.fromJson(map);
        return homeTodaysDealModel;
      }
    } catch (error) {
      print("Error : $error");
    }
    CommonSnackBarMessage.errorMessage(text: 'Data fetch Failed', context: context);
    print('Data fetch Failed');
    return homeTodaysDealModel;
  }
}