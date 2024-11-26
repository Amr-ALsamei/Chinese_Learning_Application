import 'package:chinese_ap/Controller/Auth/successed_SignUpController.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessedSignUp extends StatelessWidget {
  const SuccessedSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SuccessedSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "نجحت العملية",
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        backgroundColor: Appcolors.background,
        body: GetBuilder<SuccessedSignUpControllerImp>(
          builder: (controller) => Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color: Appcolors.primarycolor,
                  ),
                  const CustumFormText(
                      text: "شكرا لك على إتمام خطوات إنشاء الحساب"),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    child: CustumButtonAuth(
                      text: "الانتقال الى الدخول",
                      onPressed: () {
                        controller.goToLogin();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
