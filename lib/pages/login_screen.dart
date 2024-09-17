import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_sell/common_widgets/custom_text_filds.dart';
import 'package:take_sell/pages/dashboard_screen.dart';
import 'package:take_sell/pages/sign_up_screen.dart';
import 'package:take_sell/providers/auth_provider.dart';
import 'package:take_sell/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 40,
                          ),
                          children: [
                            TextSpan(
                              text: 'Only',
                              style: TextStyle(
                                fontFamily: 'Teko',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Digital',
                              style: TextStyle(
                                fontFamily: 'Teko',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),

                      //Categorias
                      SizedBox(
                        height: 30,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontFamily: 'Questrial',
                            fontSize: 24,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText('Sprints'),
                              FadeAnimatedText('3D models'),
                              FadeAnimatedText('Footage'),
                              FadeAnimatedText('Planners'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child:
                        Consumer<AuthProvider>(builder: (context, provider, _) {
                      return Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ///Email
                            CustomTextField(
                              icon: Icons.mail,
                              label: 'Enter your email',
                              controller: emailController,
                            ),

                            ///Password
                            CustomTextField(
                              icon: Icons.lock,
                              label: 'Enter your password',
                              isSecret: true,
                              controller: passController,
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                ),
                                onPressed: () {
                                  provider.loginService(
                                      context,
                                      emailController.text,
                                      passController.text,
                                      formKey);
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot your password?',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey.withAlpha(90),
                                      thickness: 2,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18),
                                    child: Text('Or'),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey.withAlpha(90),
                                      thickness: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(45)),
                                    side: const BorderSide(
                                      width: 2,
                                    )),
                                onPressed: () => Navigator.pushNamed(
                                    context, SignUpScreen.routeName),
                                child: const Text(
                                  'Create account',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
              Positioned(
                right: 16,
                top: 16,
                child: SafeArea(
                  child: TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, DashboardScreen.routeName),
                      child: const Text(
                        'SKIP >>',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
