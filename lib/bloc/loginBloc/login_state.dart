part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String errorMsg;
  final PostApiStatus postApiStatus;

  const LoginState(
      {this.email = '',
      this.password = '',
      this.postApiStatus = PostApiStatus.initial,
      this.errorMsg = ''});

  LoginState copyWith(
      {String? mail,
      String? pass,
      PostApiStatus? postApiStatus,
      String? errorMsg}) {
    return LoginState(
        email: mail ?? email,
        password: pass ?? password,
        postApiStatus: postApiStatus ?? this.postApiStatus,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  List<Object?> get props => [email, password, postApiStatus, errorMsg];
}
