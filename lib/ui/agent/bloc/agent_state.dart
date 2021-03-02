part of 'agent_bloc.dart';

abstract class AgentState extends Equatable {
  const AgentState();

  @override
  List<Object> get props => [];
}

class AgentInitial extends AgentState {}

class AgentInProgress extends AgentState {}

class AgentIsLoaded extends AgentState {}

class AgentSuccess extends AgentState {
  final String message;

  const AgentSuccess({@required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AgentSuccess { message: $message }';
}

class AgentFailure extends AgentState {
  final String error;

  const AgentFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AgentFailure { error: $error }';
}

class AgentNetworkError extends AgentState {
  final String message;

  const AgentNetworkError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AgentNetworkError { message: $message }';
}
