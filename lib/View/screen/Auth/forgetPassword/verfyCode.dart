import 'package:chinese_ap/Controller/Auth/verify_controller.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VerificationControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "التحقق من الكود",
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<VerificationControllerImp>(
        builder: (controller) => Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const CustumFormLable(
                  label: "تحقق من الكود",
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustumFormText(
                    text: "تسجيل الدخول عن طريق الايميل وكلمة المرور"),
                const SizedBox(
                  height: 30,
                ),
                OtpTextField(
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: Appcolors.primarycolor,
                  showFieldAsBox: true,
                  onCodeChanged: (String Code) {},
                  onSubmit: (String Verification) {
                    controller.goToResetPassword(Verification);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
