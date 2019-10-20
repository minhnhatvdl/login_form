import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/blocs/login/bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
  }

  void _handleLoginForm() {
    _loginBloc.add(LoginButtonPressed(
        username: _usernameController.value.text,
        password: _usernameController.value.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) async {
        if (state is LoginError) {
          Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              state.error,
              style: ThemeData.dark().textTheme.body1,
            ),
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, LoginState state) {
        print('LoginForm $state');
        return Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (String value) {
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.navigate_next),
                ),
                validator: (String value) {
                  return null;
                },
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: state is! LoginLoading ? _handleLoginForm : null,
              ),
              Container(
                child:
                    state is LoginLoading ? CircularProgressIndicator() : null,
              )
            ],
          ),
        );
      }),
    );
  }
}
