import 'package:chinese_ap/Controller/Auth/edit_name_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/function/validator.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditUserNameController());
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل الاسم"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<EditUserNameController>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const CustumFormLable(
                  label: "تعديل الاسم",
                ),
                const Icon(
                  Icons.note_alt_outlined,
                  size: 150,
                  color: Appcolors.primarycolor,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: controller.formstateEdit,
                    child: Column(
                      children: [
                        CustumFormField(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 2, 50, "username");
                            },
                            label: "الاسم",
                            hinttext: "أدخل اسمك هنا",
                            icon: Icons.person_outline,
                            mycontroller: controller.userName),
                      ],
                    )),
                const SizedBox(
                  height: 170,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.primarycolor),
                    onPressed: () {
                      controller.editName();
                    },
                    child: const Text(
                      "تعديل",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
