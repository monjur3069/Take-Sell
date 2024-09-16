import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:take_sell/pages/cart_screen.dart';
import 'package:take_sell/pages/category_screen.dart';
import 'package:take_sell/pages/explore_screen.dart';
import 'package:take_sell/pages/home_screen.dart';
import 'package:take_sell/pages/profile_screen.dart';

import '../utils/constants.dart';

class DashboardProvider extends ChangeNotifier{
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  var currentIndex = 2;
  var items = [
    const FittedBox(
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart),
            Text('Explore',style: TextStyle(color: primaryWhite,fontSize: 10),)
          ],
        ),
      ),
    ),
    const FittedBox(
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.description_outlined),
            Text('Categories',style: TextStyle(color: primaryWhite,fontSize: 10),)
          ],
        ),
      ),
    ),
    const FittedBox(
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.home),
            Text('Home',style: TextStyle(color: primaryWhite,fontSize: 10),)
          ],
        ),
      ),
    ),
    const FittedBox(
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.chat),
            Text('Cart',style: TextStyle(color: primaryWhite,fontSize: 10),)
          ],
        ),
      ),
    ),
    const FittedBox(
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.person),
            Text('Profile',style: TextStyle(color: primaryWhite,fontSize: 10),)
          ],
        ),
      ),
    ),

  ];
  var screens = [
    const ExploreScreen(),
    const CategoryScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen()

  ];

  changeIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }
}