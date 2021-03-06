import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temancurhat/shared/styles/styles.dart';
import 'package:temancurhat/ui/authentication/authentication_bloc.dart';
import 'package:temancurhat/ui/login/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: MyColors.bgBlueGrey,
      theme: kDefaultTheme,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationSuccess) {
            return LoginScreen();
          } else if (state is AuthenticationFailure) {
            return Container();
          } else if (state is AuthenticationInProgress) {
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
