import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomix/app/core/themes/themes.dart';
import '../../../core/themes/colors.dart';
import '../../../core/widgets/rounded_button.dart';
import 'controller.dart';

class AboutPage extends GetView<AboutController> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                  'https://c.tenor.com/0hjOGLFaQa0AAAAC/lofi-girl-lofi.gif'),
              Column(
                children: [
                  const Text(
                    'Bem vindo!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Escolha as músicas conforme seu humor do dia.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ],
              ),
              RoundedButton(
                onPressed: () {
                  // controller.navigateToHome();
                  if (Get.isDarkMode) {
                    Get.changeTheme(AppTheme(colors: RandomixColors()).light);
                    return;
                  }
                  Get.changeTheme(AppTheme(colors: RandomixColors()).dark);
                },
                title: 'Continue',
              )
            ],
          ),
        ),
      ),
    );
  }
}
