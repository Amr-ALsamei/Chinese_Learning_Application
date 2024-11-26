import 'package:chinese_ap/Controller/Auth/resetPasswordController.dart';
import 'package:chinese_ap/Core/function/validator.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تعيين كلمة المرور",
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const CustumFormLable(
                  label: "إعادة تعيين كلمة مرور جديدة",
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: controller.formstateRestpassword,
                    child: Column(
                      children: [
                        GetBuilder<ResetPasswordControllerImp>(
                            builder: (controller) {
                          return CustumFormField(
                              obsecureText: controller.isShowPassWord,
                              onTapIcon: () => controller.ShowPassWord(),
                              isNumber: false,
                              valid: (val) {
                                return ValidInput(val!, 5, 30, "password");
                              },
                              label: " كلمة المرور",
                              hinttext: "أدخل  كلمة المرور",
                              icon: Icons.lock_outline,
                              mycontroller: controller.NewPassword);
                        }),
                        const SizedBox(
                          height: 25,
                        ),
                        GetBuilder<ResetPasswordControllerImp>(
                            builder: (controller) {
                          return CustumFormField(
                              obsecureText: controller.isShowPassWord1,
                              onTapIcon: () => controller.ShowPassWord1(),
                              isNumber: false,
                              valid: (val) {
                                return ValidInput(val!, 5, 30, "password");
                              },
                              label: "تأكيد كلمة المرور",
                              hinttext: "يرجى تأكيد كلمة المرور",
                              icon: Icons.lock_outline,
                              mycontroller: controller.ReNewPassword);
                        }),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustumButtonAuth(
                  text: "حفظ",
                  onPressed: () {
                    if (controller.NewPassword.text ==
                        controller.ReNewPassword.text) {
                      controller.goTSuccessResetPassword();
                    } else {
                      Get.defaultDialog(
                          title: "خطأ", middleText: "كلمة المرور عير متطابقة");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
