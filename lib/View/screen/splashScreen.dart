import 'package:chinese_ap/View/screen/Onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewScreen extends StatefulWidget {
  const SplashViewScreen({super.key});

  @override
  _SplashViewScreenState createState() => _SplashViewScreenState();
}

class _SplashViewScreenState extends State<SplashViewScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xff4d0687),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Spacer(),
              const Text(
                'تطبيق تعلم اللغة الصينية',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeTransition(
                opacity: fadingAnimation!,
                child: const Text(
                  textAlign: TextAlign.center,
                  ' مرحبا بك في تطبيق تعلم اللغة الصينية! انضم الينا في رحلة تعلم اللغة الصينية. ابدأ الان واكسب مهارات جديدة تفتح لك علما من المتعة',
                  style: TextStyle(
                    height: 2,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 7), () {
      Get.to(() => const OnBoarding(), transition: Transition.fade);
    });
  }
}
