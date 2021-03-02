part of 'lupa_password_bloc.dart';

abstract class LupaPasswordEvent extends Equatable {
  const LupaPasswordEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LupaPasswordButtonPressed extends LupaPasswordEvent {
  final String username;
  final String password;

  const LupaPasswordButtonPressed({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LupaPasswordButtonPressed { username: $username, password: $password }';
}
