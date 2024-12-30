import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/loginBloc/login_bloc.dart';
import '../../../../utils/valodations.dart';

/// A widget representing the email input field.
class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          focusNode: focusNode, // Setting focus node
          decoration: InputDecoration(
            icon: const Icon(Icons.email), // Icon for email input field
          ),
          keyboardType: TextInputType
              .emailAddress, // Setting keyboard type to email address
          onChanged: (value) {
            // Dispatching EmailChanged event when email input changes
            context.read<LoginBloc>().add(EmailChangedEvent(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter email';
            }
            if (!Valodations.emailValidator(value)) {
              return 'Email is incorrect';
            }

            return null;
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
