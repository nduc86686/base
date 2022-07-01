import 'package:flutter/material.dart';

import 'text_field_container.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.inputType,
    this.controller,
    this.maxLength,
    this.onSubmitted,
    this.initialValue,
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.errorText,
    this.textInputAction,
  }) : super(key: key);

  final TextInputType? inputType;
  final TextEditingController? controller;
  final int? maxLength;
  final Function? onSubmitted;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode? autovalidateMode;
  final Function(String)? onChanged;
  final String? errorText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        key: key,
        initialValue: initialValue,
        keyboardType: inputType,
        autocorrect: false,
        style: null,
        maxLines: 1,
        maxLength: maxLength,
        onChanged: onChanged,
        // cursorColor: Palette.diSerria,
        // decoration: TcStyle.textField,
        onSaved: (_) => onSaved,
        controller: controller,
        autovalidateMode: autovalidateMode,
        textInputAction: textInputAction,
      ),
    );
  }
}
