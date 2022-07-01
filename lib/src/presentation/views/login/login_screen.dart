import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/formz_models/email.dart';
import '../../cubit/login_cubit/login_screen_cubit.dart';
import '../../cubit/login_cubit/login_screen_state.dart';
import '../../widgets/text_field_widget/input_field.dart';
import '../../widgets/text_field_widget/password_field.dart';
import '../../widgets/text_field_widget/show_error_textfield_widget.dart';
import '../../widgets/text_field_widget/text_field_authenticate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _EmailWidget(),
          _PasswordWidget()
        ],
      ),
    );
  }
}
class _EmailWidget extends StatefulWidget {
  const _EmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<_EmailWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreenCubit, LoginScreenState>(
      listenWhen: (_, cur) => _controller.text != cur.email.value,
      listener: (_, state) => _controller.text = state.email.value,
      builder: (context, state) {
        return TextFieldAuthenticate(
          title: 'Email',
          textfield: InputField(
            key: const Key('loginForm_usernameInput_textField'),
            controller: _controller,
            inputType: TextInputType.emailAddress,
            onChanged: context.read<LoginScreenCubit>().emailChange,
            textInputAction: TextInputAction.next,
          ),
          error: ShowErrorTextFieldWidget(
            showError: state.email.invalid,
            content: EmailError.invalid.name,
          ),
        );
      },
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      builder: (context, state) {
        return TextFieldAuthenticate(
          title: 'Password',
          textfield: PasswordField(
            key: const Key('loginForm_passwordInput_textField'),
            initialValue: state.initPassword,
            onChanged: context.read<LoginScreenCubit>().passwordChange,
            textInputAction: TextInputAction.done,
          ),
          error: ShowErrorTextFieldWidget(
            showError: state.password.invalid,
            content: 'PasswordError.invalid.name',
          ),
        );
      },
    );
  }
}