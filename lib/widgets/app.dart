import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_login/blocs/authentication/bloc.dart';
import 'package:flutter_login/repositories/user_repository.dart';
import 'package:flutter_login/widgets/home_screen.dart';
import 'package:flutter_login/widgets/loading.dart';
import 'package:flutter_login/widgets/login_screen.dart';
import 'package:flutter_login/widgets/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (_) => AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted()),
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) {
              print('App $state');
          if (state is AuthenticationLoading) {
            return Loading();
          }
          if (state is AuthenticationAuthenticated) {
            return HomeScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginScreen(
              userRepository: userRepository,
            );
          }
          return Splash();
        }),
        theme: ThemeData.dark(),
      ),
    );
  }
}