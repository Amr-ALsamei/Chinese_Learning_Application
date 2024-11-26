import 'package:chinese_ap/Controller/Learning/Sentences/edit_sentences_controller.dart';

import 'package:chinese_ap/Core/class/handlingdataview.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:chinese_ap/Core/function/validator.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformLabel.dart';
import 'package:chinese_ap/View/widget/Auth_FormFields/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSentenceScreen extends StatelessWidget {
  const EditSentenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SentencesEditController());
    return Scaffold(
      appBar: AppBar(
        title: Text("الجمل"),
      ),
      body: GetBuilder<SentencesEditController>(
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
                                return ValidInput(val!, 1, 100, "sentence");
                              },
                              label: "الجملة",
                              hinttext: "ادخل الجملة هنا",
                              icon: Icons.edit_note_rounded,
                              mycontroller: controller.sentece),
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
