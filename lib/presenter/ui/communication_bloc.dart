import 'package:bloc/bloc.dart';

class CommunicationEvent {
  CommunicationEvent._();

  factory CommunicationEvent.start() => StartCommunicationEvent();
  factory CommunicationEvent.childAdded() => ChildAddEvent();
  factory CommunicationEvent.childRemoved() => ChildRemoveEvent();
}

class StartCommunicationEvent extends CommunicationEvent {
  StartCommunicationEvent() : super._();
}

class ChildAddEvent extends CommunicationEvent {
  ChildAddEvent() : super._();
}

class ChildRemoveEvent extends CommunicationEvent {
  ChildRemoveEvent() : super._();
}


class CommunicationBloc extends Cubit<CommunicationEvent>{

  CommunicationBloc._() : super(CommunicationEvent.start());

  static CommunicationBloc? _instance;

  static CommunicationBloc get instance =>
      _instance ??= CommunicationBloc._();
}