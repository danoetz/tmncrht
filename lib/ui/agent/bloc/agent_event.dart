part of 'agent_bloc.dart';

abstract class AgentEvent extends Equatable {
  const AgentEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AgentInit extends AgentEvent {}

class AgentLoad extends AgentEvent {}
