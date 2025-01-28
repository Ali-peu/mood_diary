import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  final String text;
  const FormText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Color.fromRGBO(76, 76, 105, 1),
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.w800),
    );
  }
}
