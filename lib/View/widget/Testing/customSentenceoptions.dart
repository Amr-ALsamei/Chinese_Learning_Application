import 'package:chinese_ap/Controller/Testing/sentences_test_controller.dart';
import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSentenceOptions extends GetView<SentencesTesController> {
  const CustomSentenceOptions(this.i, this.optiontxt, {super.key});
  final int i;
  final String optiontxt;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.checkAnswer(
            controller.splitsentece[i], controller.trueoption!, i);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.blueGrey[100]),
        child: Text(controller.splitsentece[i],
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // height: 1.5,
                color: Appcolors.primarycolor)),
      ),
    );
  }
}
