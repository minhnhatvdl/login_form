import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/blocs/authentication/bloc.dart';
import 'package:flutter_login/blocs/login/bloc.dart';
import 'package:flutter_login/repositories/user_repository.dart';
import 'package:flutter_login/widgets/LoginScreen/login_form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({@required this.userRepository});
  final UserRepository userRepository;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserRepository get _userRepository => widget.userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
          builder: (BuildContext context) => LoginBloc(
                userRepository: _userRepository,
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context),
              ),
          child: LoginForm()),
    );
  }
}
