import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  AgentBloc() : super(AgentInitial());

  @override
  AgentState get initialState => AgentInitial();

  @override
  Stream<AgentState> mapEventToState(AgentEvent event) async* {
    if (event is AgentLoad) {
      yield* _mapAgentLoadToState();
    }
  }

  Stream<AgentState> _mapAgentLoadToState() async* {
    yield AgentIsLoaded();
  }
}
