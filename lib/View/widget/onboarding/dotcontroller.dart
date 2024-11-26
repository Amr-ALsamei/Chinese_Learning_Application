import 'package:chinese_ap/Controller/onboarding_controller.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Data/DataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotController extends StatelessWidget {
  const CustomDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImpllement>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onboardinglist.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(microseconds: 700),
                    width: controller.currentPage == index ? 20 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Appcolors.primarycolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
        ],
      ),
    );
  }
}
