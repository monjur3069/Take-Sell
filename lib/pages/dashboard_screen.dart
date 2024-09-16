import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:take_sell/providers/dashboard_provider.dart';
import 'package:take_sell/utils/constants.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //It should be false to work
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Confirmation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              content: const Text('Are you sure you want to exit?'),
              actions: [
                GestureDetector(
                  onTap: () => Navigator.pop(context, false), // Close the dialog
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: primaryRed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: primaryWhite),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    SystemNavigator.pop(); // Exit the app
                  },
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Yes',
                        style: TextStyle(color: primaryWhite),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );

        /*Get.defaultDialog(
          title: 'Confirmation',
          titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          content: const Text('Are you sure  to exit?'),
          actions: [
            GestureDetector(
              onTap: () => Navigator.pop(context, false),
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    color: primaryRed,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: primaryWhite),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text(
                      'Yes',
                      style: TextStyle(color: primaryWhite),
                    )),
              ),
            ),
          ],
        );*/ //Here this temporary, you can change this line
      },
      child: Scaffold(
        // body: Obx(() => controller.screens[controller.currentIndex.value]),
        body: Consumer<DashboardProvider>(
          builder: (context,provider,_)=>provider.screens[provider.currentIndex],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white),),
          child: Consumer<DashboardProvider>(
            builder: (context, controller, _) =>
                CurvedNavigationBar(
                  key: controller.bottomNavigationKey,
                  height: 60,
                  backgroundColor: Colors.transparent,
                  buttonBackgroundColor: primaryColor,
                  color: primaryColor,
                  index: controller.currentIndex,
                  items: controller.items,
                  onTap: (newIndex) {
                    controller.changeIndex(newIndex);
                  },
                ),
          ),
        ),
      ),
    );
  }
}
