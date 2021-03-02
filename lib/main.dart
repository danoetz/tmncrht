import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temancurhat/app.dart';
import 'package:temancurhat/bloc_observer.dart';
import 'package:temancurhat/ui/authentication/authentication_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc()..add(AuthenticationStarted());
      },
      child: App(),
    ),
  );
}
