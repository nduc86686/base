import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../config/config.dart';
// import '../../cubit/boolean/boolean_cubit.dart';
// import '../../gen/assets.gen.dart';
import 'text_field_container.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    this.inputType,
    this.initialValue,
    this.onSaved,
    this.onChanged,
    this.errorText,
    this.textInputAction,
  }) : super(key: key);

  final TextInputType? inputType;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
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
        // obscureText: state,
        obscuringCharacter: '●',
        autocorrect: false,
        // style: TcFont.textXSmallBold.copyWith(
        //   fontSize: 12,
        //   fontWeight: FontWeight.w600,
        // ),
        maxLines: 1,
        onChanged: onChanged,
        // cursorColor: Palette.diSerria,
        // decoration: TcStyle.textField.copyWith(
        //     suffixIcon: IconButton(
        //   icon: state
        //       ? Assets.icons.hidePass.svg()
        //       : Assets.icons.showPass.svg(),
        //   onPressed: context.read<BooleanCubit>().changeStatus,
        // )),
        onSaved: (_) => onSaved,
        textInputAction: textInputAction,
      ),
    );
  }
}
