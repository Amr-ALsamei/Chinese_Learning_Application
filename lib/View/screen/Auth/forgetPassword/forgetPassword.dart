import 'package:chinese_ap/Controller/Auth/forgetpasswordController.dart';
import 'package:chinese_ap/Core/function/validator.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformText.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformfield.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " نسيت كلمة المرور",
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const LogoAuth(),
                const CustumFormLable(
                  label: "التحقق من الايميل",
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustumFormText(
                    text: "للتأكيد يرجى إدحال الايميل للتحقق من الحساب"),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: controller.formstateforgetpassword,
                    child: Column(
                      children: [
                        CustumFormField(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 3, 100, "email");
                            },
                            label: "الايميل",
                            hinttext: "أدخل الايميل هنا",
                            icon: Icons.email_outlined,
                            mycontroller: controller.email),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustumButtonAuth(
                  text: "تحقق",
                  onPressed: () {
                    controller.CheckEmail();
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
