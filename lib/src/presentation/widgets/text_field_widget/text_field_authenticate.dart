import 'package:flutter/material.dart';

class TextFieldAuthenticate extends StatelessWidget {
  const TextFieldAuthenticate({
    Key? key,
    required this.textfield,
    required this.title,
    required this.error,
  }) : super(key: key);

  final String title;
  final Widget textfield;
  final Widget error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        const SizedBox(
          height: 4,
        ),
        textfield,
        error,
      ],
    );
  }
}
