import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class Login extends AuthenticationEvent {
  final String token;
  const Login({@required this.token}) : assert(token != null);

  @override
  String toString() => 'Login { token: $token }';
}

class Logout extends AuthenticationEvent {
  @override
  String toString() => 'Logout';
}
