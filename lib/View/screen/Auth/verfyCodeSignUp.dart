import 'package:chinese_ap/Controller/Auth/verify_controller_SignUp.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationCodeSignUp extends StatelessWidget {
  const VerificationCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VerificationControllerSignUpImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "التحقق من الكود",
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: GetBuilder<VerificationControllerSignUpImp>(
          builder: (controller) => Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const CustumFormLable(
                      label: "تحقق من الكود",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustumFormText(
                        text:
                            "يرجى إدخال الكود الذي تم إرساله الى  ${controller.email}"),
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
                      onSubmit: (String VerificationCode) {
                        controller.goToSuccessSignUp(VerificationCode);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        controller.Resend();
                      },
                      child: const Center(
                        child: Text(
                          "إعادة إرسال الرمز",
                          style: TextStyle(
                              fontSize: 20, color: Appcolors.primarycolor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
