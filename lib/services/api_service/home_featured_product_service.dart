import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:take_sell/models/home_featured_product_model.dart';
import 'package:take_sell/services/api_service/common_function/common_snackbar_message.dart';
import 'package:take_sell/services/apis.dart';

class HomeFeaturedProductService{
  static Future<HomeFeaturedProductModel?> fetchHomeFeaturedProductData(BuildContext context) async {
    HomeFeaturedProductModel? homeFeaturedProductModel;
    final uri = Uri.parse(Apis.homeFeaturedProduct);
    try {
      final response = await http.get(uri,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final map = jsonDecode(response.body);

      if (response.statusCode == 200) {
        homeFeaturedProductModel = HomeFeaturedProductModel.fromJson(map);
        return homeFeaturedProductModel;
      }
    } catch (error) {
      print("Error : $error");
    }
    CommonSnackBarMessage.errorMessage(text: 'Data fetch Failed', context: context);
    print('Data fetch Failed');
    return homeFeaturedProductModel;
  }
}