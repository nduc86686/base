import 'package:flutter/material.dart';

class ShowErrorTextFieldWidget extends StatelessWidget {
  const ShowErrorTextFieldWidget({
    Key? key,
    this.content,
    required this.showError,
  }) : super(key: key);

  final bool showError;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return showError
        ? SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  // Assets.svg.loginScreen.icError.svg(
                  //   height: 16,
                  // ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '$content',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
