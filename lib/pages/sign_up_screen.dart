import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:take_sell/common_widgets/custom_text_filds.dart';
import 'package:take_sell/utils/constants.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign_up';
  SignUpScreen({super.key});


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
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white),
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white),
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            icon: Icons.person,
                            label: 'Name',
                          ),
                          CustomTextField(
                            icon: Icons.phone,
                            label: 'Cell phone',
                            inputFormatters: [celularFormatter],
                          ),
                          const CustomTextField(
                            icon: Icons.mail,
                            label: 'Email',
                          ),
                          const CustomTextField(
                            icon: Icons.lock,
                            label: 'Password',
                            isSecret: true,
                          ),
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    primaryColor,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Create account',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  )))
                        ])),
              ]),
              Positioned(
                left: 16,
                top: 16,
                child: SafeArea(
                  child: IconButton(
                    onPressed: ()=> Navigator.pop(context),
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
