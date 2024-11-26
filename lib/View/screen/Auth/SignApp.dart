import 'package:chinese_ap/Controller/Auth/signUpController.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/function/validator.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformfield.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customtextSignup&signIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignApp extends StatelessWidget {
  const SignApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "إنشاء حساب جديد",
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustumTextSignUpORSignIn(
                  txt1: "هل لديك حساب بالفعل ؟",
                  txt2: " سجل دخولك هنا",
                  onTap: () {
                    controller.goToLogIn();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: controller.formstateSignUp,
                    child: Column(
                      children: [
                        CustumFormField(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 2, 100, "username");
                            },
                            label: "الاسم",
                            hinttext: "أدخل الاسم هنا",
                            icon: Icons.person_outline,
                            mycontroller: controller.userName),
                        CustumFormField(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 3, 100, "email");
                            },
                            label: "الايميل",
                            hinttext: " أدخل الايميل هنا",
                            icon: Icons.email_outlined,
                            mycontroller: controller.email),
                        CustumFormField(
                            isNumber: true,
                            valid: (val) {
                              return ValidInput(val!, 5, 15, "phone");
                            },
                            label: "الجوال ",
                            hinttext: "أدخل رقم الجوال هنا",
                            icon: Icons.phone_android_outlined,
                            mycontroller: controller.phonNumber),
                        GetBuilder<SignUpControllerImp>(builder: (controller) {
                          return CustumFormField(
                              obsecureText: controller.isShowPassWord,
                              onTapIcon: () => controller.ShowPassWord(),
                              isNumber: false,
                              valid: (val) {
                                return ValidInput(val!, 2, 30, "password");
                              },
                              label: "كلمة المرور",
                              hinttext: "أدخل كلمة المرور هنا ",
                              icon: Icons.lock_outline,
                              mycontroller: controller.password);
                        }),
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustumButtonAuth(
                  text: "إنشاء حساب",
                  onPressed: () {
                    controller.signUp();
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
