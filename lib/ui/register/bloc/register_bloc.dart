import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(null);

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterInProgress();
      try {
        var user =
            await Future.delayed(Duration(seconds: 3)).then((value) => true);
        if (user) {
          print(user);
          yield RegisterSuccess(message: "Register berhasil");
        } else {
          yield RegisterFailure(error: "Register gagal");
        }
      } catch (error) {
        yield RegisterFailure(error: "Network error");
      }
    }
  }
}
