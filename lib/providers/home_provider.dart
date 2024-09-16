import 'dart:async';

import 'package:flutter/material.dart';
import 'package:take_sell/models/home_category_model.dart';
import 'package:take_sell/models/home_featured_product_model.dart';
import 'package:take_sell/models/home_slider_model.dart';
import 'package:take_sell/models/home_todays_deal_model.dart';
import 'package:take_sell/services/api_service/home_category_service.dart';
import 'package:take_sell/services/api_service/home_featured_product_service.dart';
import 'package:take_sell/services/api_service/home_slider_service.dart';
import 'package:take_sell/services/api_service/home_todays_deal_service.dart';
import 'package:take_sell/utils/constants.dart';

class HomeProvider extends ChangeNotifier{

  ScrollController scrollController = ScrollController();

  var images = [];
  int currentPage = 0;
  final PageController pageController = PageController();
  changeIndex(int index){
    currentPage = index;
    notifyListeners();
  }
  List<Widget> buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < images.length; i++) {
      indicators.add(
        AnimatedContainer(
          padding: EdgeInsets.zero,
          duration: const Duration(milliseconds: 300),
          width: currentPage == i ? 20 : 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: currentPage == i ? primaryColor : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }


  late Timer _timer;
  void startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < images.length - 1) {
        currentPage++;
        notifyListeners();
      } else {
        currentPage = 0;// Loop back to the beginning
        notifyListeners();
      }

      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      notifyListeners();
    });
  }


  HomeSliderModel? homeSliderModel;
  var newSliderList = [];
  bool isSliderDataLoaded = false;
  fetchHomeSliderData(BuildContext context) async {
    homeSliderModel = await HomeSliderService.fetchHomeSliderData(context);
    newSliderList = homeSliderModel?.data ?? [];
    isSliderDataLoaded = true;
    for (var i in newSliderList) {
      if (i.photo != null) {
        images.add(i.photo);
      }
    }
    print(images.length);
    if(newSliderList.isNotEmpty){
      startAutoSlide();
    }
    notifyListeners();
  }

  HomeCategoryModel? homeCategoryModel;
  var newCategoryList = [];
  bool isCategoryDataLoaded = false;
  fetchHomeCategoryData(BuildContext context) async {
    homeCategoryModel = await HomeCategoryService.fetchHomeCategoryData(context);
    newCategoryList = homeCategoryModel?.data ?? [];
    isCategoryDataLoaded = true;
    notifyListeners();
  }

  HomeTodaysDealModel? homeTodaysDealModel;
  var newTodaysDealList = [];
  bool isTodaysDealDataLoaded = false;
  fetchHomeTodaysDeal(BuildContext context) async {
    homeTodaysDealModel = await HomeTodaysDealService.fetchHomeTodaysDealData(context);
    newTodaysDealList = homeTodaysDealModel?.data ?? [];
    isTodaysDealDataLoaded = true;
    notifyListeners();
  }


  HomeFeaturedProductModel? homeFeaturedProductModel;
  var newFeaturedProductList = [];
  bool isFeaturedProductLoaded = false;
  fetchHomeFeaturedProduct(BuildContext context) async {
    homeFeaturedProductModel = await HomeFeaturedProductService.fetchHomeFeaturedProductData(context);
    newFeaturedProductList = homeFeaturedProductModel?.data ?? [];
    isFeaturedProductLoaded = true;
    notifyListeners();
  }




}