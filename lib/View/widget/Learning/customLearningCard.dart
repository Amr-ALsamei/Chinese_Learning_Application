import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:flutter/material.dart';

class Customlearningcard extends StatelessWidget {
  const Customlearningcard(
      {super.key, required this.imag, required this.titletxt});
  final String imag;
  final String titletxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolors.thirdcolor, borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              imag,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Text(
            titletxt,
            style: const TextStyle(height: 1),
          ))
        ],
      ),
    );
  }
}
