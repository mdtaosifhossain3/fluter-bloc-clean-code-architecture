import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/loginBloc/login_bloc.dart';
import 'widgets/email_input_widget.dart';
import 'widgets/password_input_widget.dart';
import 'widgets/submit_button_widget.dart';

/// A widget representing the login screen of the application.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// The state of the [LoginScreen] widget.
class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBlocs;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBlocs = LoginBloc();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _loginBlocs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _loginBlocs,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                EmailInput(
                    focusNode: _emailFocusNode), // Widget for email input field
                PasswordInput(
                    focusNode:
                        _passwordFocusNode), // Widget for password input field
                SubmitButton(
                  formKey: _formKey,
                ), // Widget for submit button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
