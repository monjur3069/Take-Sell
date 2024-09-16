import 'package:flutter/material.dart';
import 'package:take_sell/pages/login_screen.dart';
import 'package:take_sell/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2),
            // () => Get.offAllNamed(Routes.loginRoute)
            () => Navigator.pushReplacementNamed(context,LoginScreen.routeName)
    );

    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
              CircularProgressIndicator(color: Colors.white,)
            ],
          )
      ),
    );
  }
}
