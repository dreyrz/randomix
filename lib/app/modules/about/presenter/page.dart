import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/strings.dart';
import '../../../core/utils/images_path.dart';

import '../../../core/widgets/button.dart';
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
            children: [
              const Spacer(flex: 20),
              Flexible(
                flex: 40,
                child: SvgPicture.asset(
                  SvgImagesPath.aboutImage,
                ),
              ),
              const Spacer(flex: 15),
              Column(
                children: [
                  Text(
                    Get.find<IStrings>().welcome,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    Get.find<IStrings>().aboutDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
              const Spacer(flex: 15),
              Button(
                onPressed: controller.navigateToHome,
                title: Get.find<IStrings>().continuee,
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}
