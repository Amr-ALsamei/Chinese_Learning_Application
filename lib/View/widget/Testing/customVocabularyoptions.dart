import 'package:chinese_ap/Controller/Testing/vocabulary_test_controller.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomVocabularyOptions extends GetView<VocabulariesTesController> {
  const CustomVocabularyOptions(this.i, {super.key});
  final int i;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.checkAnswer(
            controller.data[i].vocabularyBody!, controller.indx, i);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.blueGrey[100]),
        child: Text(controller.data[i].vocabularyBody!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors.primarycolor)),
      ),
    );
  }
}
