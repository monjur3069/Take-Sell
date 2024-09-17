import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:take_sell/common_widgets/custom_text_filds.dart';
import 'package:take_sell/providers/auth_provider.dart';
import 'package:take_sell/utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign_up';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(
        r'[0-9]',
      ),
    },
  );

  final celularFormatter = MaskTextInputFormatter(
    mask: '## ## # ####-####',
    filter: {
      '#': RegExp(
        r'[0-9]',
      ),
    },
  );

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
              Column(children: [
                const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Create your free',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Text(
                          'Account',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              icon: Icons.person,
                              label: 'Name',
                              controller: nameController,
                            ),
                            CustomTextField(
                              icon: Icons.phone,
                              label: 'Cell phone',
                              // inputFormatters: [celularFormatter],
                              controller: phoneController,
                            ),
                            CustomTextField(
                              icon: Icons.mail,
                              label: 'Email',
                              controller: emailController,
                            ),
                            CustomTextField(
                              icon: Icons.lock,
                              label: 'Password',
                              isSecret: true,
                              controller: passController,
                            ),
                            Consumer<AuthProvider>(
                                builder: (context, provider, _) {
                              return SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                      ),
                                      onPressed: () {
                                        provider.signUp(
                                            context,
                                            nameController.text,
                                            phoneController.text,
                                            emailController.text,
                                            passController.text,
                                            formKey);
                                      },
                                      child: const Text(
                                        'Create account',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )));
                            })
                          ]),
                    )),
              ]),
              Positioned(
                left: 16,
                top: 16,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
