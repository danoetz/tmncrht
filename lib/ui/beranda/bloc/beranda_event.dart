part of 'beranda_bloc.dart';

abstract class BerandaEvent extends Equatable {
  const BerandaEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BerandaInit extends BerandaEvent {}

class LoadNowPlaying extends BerandaEvent {}

class BerandaLoaded extends BerandaEvent {}
