import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'lupa_password_event.dart';
part 'lupa_password_state.dart';

class LupaPasswordBloc extends Bloc<LupaPasswordEvent, LupaPasswordState> {
  LupaPasswordBloc() : super(null);

  @override
  LupaPasswordState get initialState => LupaPasswordInitial();

  @override
  Stream<LupaPasswordState> mapEventToState(LupaPasswordEvent event) async* {
    if (event is LupaPasswordButtonPressed) {
      yield LupaPasswordInProgress();
      try {
        var user =
            await Future.delayed(Duration(seconds: 3)).then((value) => true);
        if (user) {
          yield LupaPasswordSuccess(message: "Login berhasil");
        } else {
          yield LupaPasswordFailure(error: "Login gagal");
        }
      } catch (error) {
        yield LupaPasswordFailure(error: "Network error");
      }
    }
  }
}
