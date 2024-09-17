import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:take_sell/pages/dashboard_screen.dart';
import 'package:take_sell/services/api_service/login_service.dart';
import 'package:take_sell/services/api_service/sign_up_service.dart';

class AuthProvider extends ChangeNotifier {
  void loginService(BuildContext context, String email, String password,GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    await EasyLoading.show(status: 'Please wait..');
    bool status = await LoginService.login(email, password);
    if (!context.mounted) return; // Check if the context is still valid
    if (status == true) {
      // AppInfo.box.put('isBeforeLogin', true);
      Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
    } else {
      Future.delayed(const Duration(seconds: 2), () => EasyLoading.dismiss());
    }
  }

  Future<void> signUp(BuildContext context, String name, String phone,
      String email, String password, GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    await EasyLoading.show(status: 'Please wait..');
    bool status = await SignUpService.signUp(
      name,
      phone,
      email,
      password,
    );


    if (status == true) {
      // AppInfo.box.put('isBeforeLogin', true);
      await EasyLoading.dismiss();
      // Ensure the context is still valid (widget is mounted) before proceeding
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
    } else {
      Future.delayed(
        const Duration(seconds: 2),
            () => EasyLoading.dismiss(),
      );
    }
  }

}
