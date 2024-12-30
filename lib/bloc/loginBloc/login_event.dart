part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class EmailChangedEvent extends LoginEvent {
  final String email;
  EmailChangedEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

class UnfocusedEmailEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class PasswordChangedEvent extends LoginEvent {
  final String password;
  PasswordChangedEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class UnfocusedPaswordEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoginApiEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
