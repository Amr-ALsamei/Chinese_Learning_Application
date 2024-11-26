import 'package:flutter/widgets.dart';

class CustumFormLable extends StatelessWidget {
  final String label;
  const CustumFormLable({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }
}
