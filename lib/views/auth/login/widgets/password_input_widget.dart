import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/loginBloc/login_bloc.dart';
import '../../../../utils/valodations.dart';

/// A widget representing the password input field.
class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          focusNode: focusNode, // Setting focus node
          decoration: InputDecoration(
            icon: const Icon(Icons.lock), // Icon for password input field

            errorMaxLines: 2, // Maximum lines for error text
          ),
          obscureText:
              true, // Making the text input obscure (i.e., showing dots instead of actual characters)
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return 'please enter password greater than 6 char';
            }

            return null;
          },
          onChanged: (value) {
            // Dispatching PasswordChanged event when password input changes
            context
                .read<LoginBloc>()
                .add(PasswordChangedEvent(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
