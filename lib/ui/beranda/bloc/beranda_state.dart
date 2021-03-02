part of 'beranda_bloc.dart';

abstract class BerandaState extends Equatable {
  const BerandaState();

  @override
  List<Object> get props => [];
}

class BerandaInitial extends BerandaState {}

class BerandaInProgress extends BerandaState {}

class BerandaIsLoaded extends BerandaState {}

class MoviesLoading extends BerandaState {}

class MoviesHasData extends BerandaState {
  final MoviesResult movieResult;

  const MoviesHasData([this.movieResult]);

  @override
  List<Object> get props => [movieResult];

  @override
  String toString() => 'MoviesResult { movieResult: $movieResult }';
}

class MoviesNoData extends BerandaState {
  final String message;

  const MoviesNoData(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'MoviesNoData { message: $message }';
}

class MoviesNetworkError extends BerandaState {
  final String message;

  const MoviesNetworkError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'MoviesNetworkError { message: $message }';
}

class BerandaSuccess extends BerandaState {
  final String message;

  const BerandaSuccess({@required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BerandaSuccess { message: $message }';
}

class BerandaFailure extends BerandaState {
  final String error;

  const BerandaFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'BerandaFailure { error: $error }';
}

class BerandaNetworkError extends BerandaState {
  final String message;

  const BerandaNetworkError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BerandaNetworkError { message: $message }';
}
