import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  const LoginError({@required this.error});
  final String error;

  @override
  String toString() => 'LoginFailure { error: $error }';
}
