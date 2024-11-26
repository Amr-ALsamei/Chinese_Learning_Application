import 'package:chinese_ap/Core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  final bool active;
  const CustomBottomAppBar(
      {super.key,
      this.onPressed,
      required this.title,
      required this.icon,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? Appcolors.primarycolor : Colors.black,
            size: active == true ? 40 : null,
          ),
          // Text(
          //   title,
          //   style: TextStyle(
          //     fontSize: active == true ? 18 : 12,
          //     color: active == true ? Appcolors.primarycolor : Colors.black,
          //   ),
          // )
        ],
      ),
    );
  }
}
