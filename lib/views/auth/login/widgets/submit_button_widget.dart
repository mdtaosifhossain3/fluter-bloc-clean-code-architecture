import 'package:another_flushbar/flushbar_helper.dart';
import 'package:bloc_clean_code_architecture/config/routes/route_name.dart';
import 'package:bloc_clean_code_architecture/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/loginBloc/login_bloc.dart';
import '../../../../utils/enums.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flushbarErrorMsg(state.errorMsg.toString(), context);
        }

        if (state.postApiStatus == PostApiStatus.succes) {
          FlushBarHelper.flushbarErrorMsg("Login Successfull", context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (current, previous) =>
              current.postApiStatus != previous.postApiStatus,
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    context.read<LoginBloc>().add(LoginApiEvent());
                  }
                },
                child: state.postApiStatus == PostApiStatus.loading
                    ? const CircularProgressIndicator()
                    : const Text('Login'));
          }),
    );
  }
}
