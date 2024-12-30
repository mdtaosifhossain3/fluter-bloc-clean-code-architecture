import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code_architecture/models/user_model.dart';
import 'package:bloc_clean_code_architecture/repository/auth/login_repository.dart';
import 'package:bloc_clean_code_architecture/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginApiEvent>(_onLoginButtonHit);
  }

  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(mail: event.email));
  }

  void _onPasswordChanged(
      PasswordChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(pass: event.password));
  }

  void _onLoginButtonHit(LoginApiEvent event, Emitter<LoginState> emit) async {
    // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    final data = {"email": state.email, "password": state.password};

    await loginRepository.loginapi(data).then((val) {
      if (val.error.isNotEmpty) {
        emit(state.copyWith(
            errorMsg: "error", postApiStatus: PostApiStatus.error));
      } else {
        emit(
          state.copyWith(
              errorMsg: "Success", postApiStatus: PostApiStatus.succes),
        );
      }
    }).catchError((e, stackError) {
      emit(state.copyWith(
          errorMsg: e.toString(), postApiStatus: PostApiStatus.error));
    });
  }
}
