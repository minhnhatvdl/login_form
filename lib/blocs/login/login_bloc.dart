import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/blocs/authentication/bloc.dart';
import 'package:flutter_login/repositories/user_repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      : assert(userRepository != null && authenticationBloc != null);
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  LoginState get initialState => LoginInit();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      try {
        yield LoginLoading();
        final String token = await userRepository.authenticate(
            username: event.username, password: event.password);
        if (token != null) authenticationBloc.add(Login(token: token));
        yield LoginError(error: 'Error');
      } catch (e) {
        yield LoginError(error: e.toString());
      } finally {
        yield LoginInit();
      }
    }
  }
}
