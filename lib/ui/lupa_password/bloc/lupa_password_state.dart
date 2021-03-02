part of 'lupa_password_bloc.dart';

abstract class LupaPasswordState extends Equatable {
  const LupaPasswordState();

  @override
  List<Object> get props => [];
}

class LupaPasswordInitial extends LupaPasswordState {}

class LupaPasswordInProgress extends LupaPasswordState {}

class LupaPasswordSuccess extends LupaPasswordState {
  final String message;

  const LupaPasswordSuccess({@required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'LupaPasswordSuccess { message: $message }';
}

class LupaPasswordFailure extends LupaPasswordState {
  final String error;

  const LupaPasswordFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LupaPasswordFailure { error: $error }';
}
