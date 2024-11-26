import 'package:chinese_ap/Controller/Learning/Vocabularies/edit_vocabulary_controller.dart';
import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/function/validator.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditVocabularyScreen extends StatelessWidget {
  const EditVocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VocabularyEditController());
    return Scaffold(
      appBar: AppBar(
        title: Text("المفردات"),
      ),
      body: GetBuilder<VocabularyEditController>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Spacer(),
                  const CustumFormLable(
                    label: "تعديل ",
                  ),
                  const Icon(
                    Icons.note_alt_outlined,
                    size: 100,
                    color: Appcolors.primarycolor,
                  ),
                  Spacer(),
                  Form(
                      key: controller.formsate,
                      child: Column(
                        children: [
                          CustumFormField(
                              isNumber: false,
                              valid: (val) {
                                return ValidInput(val!, 1, 100, "vocabulary");
                              },
                              label: "المفردة",
                              hinttext: "ادخل المفردة هنا",
                              icon: Icons.edit_note_rounded,
                              mycontroller: controller.vocabulary),
                          // const SizedBox(height: 25,),
                          // SizedBox(height: 30,),
                        ],
                      )),
                  Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.primarycolor,
                          padding: EdgeInsets.symmetric(horizontal: 100)),
                      onPressed: () {
                        controller.editData();
                      },
                      child: const Text(
                        "تعديل",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      )),
                  Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
