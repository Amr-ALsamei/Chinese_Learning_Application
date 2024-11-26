import 'package:chinese_ap/Controller/onboarding_controller.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Data/DataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImpllement> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChange(value);
      },
      itemCount: onboardinglist.length,
      itemBuilder: (context, i) => Column(
        children: [
          Image.asset(
            onboardinglist[i].image!,
            height: 270,
            width: Get.width / 1.3,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            onboardinglist[i].title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Appcolors.black,
                height: 3),
          ),
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(onboardinglist[i].body!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    height: 2,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.grey,
                    fontSize: 18,
                  ))),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
