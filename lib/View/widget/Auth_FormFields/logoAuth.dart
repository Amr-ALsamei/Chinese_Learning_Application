import 'package:chinese_ap/Core/constant/imageAssest.dart';
import 'package:flutter/widgets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAssets.logo,
      width: 170,
      height: 170,
    );
  }
}
