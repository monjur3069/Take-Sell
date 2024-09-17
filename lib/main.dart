import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:take_sell/pages/dashboard_screen.dart';
import 'package:take_sell/pages/login_screen.dart';
import 'package:take_sell/pages/sign_up_screen.dart';
import 'package:take_sell/pages/splash_screen.dart';
import 'package:take_sell/providers/auth_provider.dart';
import 'package:take_sell/providers/dashboard_provider.dart';
import 'package:take_sell/providers/home_provider.dart';
import 'package:take_sell/utils/constants.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => DashboardProvider()),
    ChangeNotifierProvider(
        create: (context) => HomeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: scaffoldBg,
      ),
      builder: EasyLoading.init(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
      },
    );
  }
}
