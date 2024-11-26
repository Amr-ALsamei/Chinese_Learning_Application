import 'package:chinese_ap/Controller/Auth/SuccedResPassWordControler.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessedResetPassword extends StatelessWidget {
  const SuccessedResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SuccessedResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "نجحت العملية",
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        backgroundColor: Appcolors.background,
        body: GetBuilder<SuccessedResetPasswordControllerImp>(
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
                                text:
                                    "شكرا لك على إتمام خطوات تغيير كلمة المرور"),
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
                          ])),
                )));
  }
}
