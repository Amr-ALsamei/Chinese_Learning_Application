import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonLanguage extends StatelessWidget {
  final String textbutton;
  void Function()? onPressed;
  ButtonLanguage(
      {super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        color: Appcolors.primarycolor,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
