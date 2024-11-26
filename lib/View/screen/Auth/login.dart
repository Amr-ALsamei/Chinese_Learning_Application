import 'package:chinese_ap/Controller/Auth/loginController.dart';
import 'package:chinese_ap/Core/function/validator.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformfield.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customtextSignup&signIn.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());
    //  Get.lazyPut(()=>LogInControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تسجيل الدخول",
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<LogInControllerImp>(
        builder: (controller) => Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const LogoAuth(),

                const SizedBox(
                  height: 20,
                ),
                CustumTextSignUpORSignIn(
                  txt1: "لا تزال جديد هنا؟",
                  txt2: "انشاء حساب جديد",
                  onTap: () {
                    controller.goToSignUp();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                // const SizedBox(height: 30,),
                Form(
                    key: controller.formstatelog,
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
                        // const SizedBox(height: 25,),
                        GetBuilder<LogInControllerImp>(builder: (controller) {
                          return CustumFormField(
                              obsecureText: controller.isShowPassword,
                              onTapIcon: () => controller.ShowPassword(),
                              isNumber: false,
                              valid: (val) {
                                return ValidInput(val!, 2, 30, "password");
                              },
                              label: "كلمة المرور",
                              hinttext: "أدخل كلمة المرور هنا",
                              icon: Icons.lock_outline,
                              mycontroller: controller.password);
                        })
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                    child: const Text(
                      "نسيت كلمة المرور",
                      textAlign: TextAlign.start,
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustumButtonAuth(
                  text: "دحول",
                  onPressed: () {
                    controller.login();
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
