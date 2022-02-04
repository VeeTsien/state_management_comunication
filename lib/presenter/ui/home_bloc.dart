import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:state_management_comunication/data/memory_db.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/communication_bloc.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {

  final CommunicationBloc communicationBloc = CommunicationBloc.instance;
  late StreamSubscription communicationSubscription;

  HomeBloc() : super(HomeState(parents: DB.parents, totalChildren: DB.parents.expand((parent) => parent.children).length)){
    communicationSubscription = communicationBloc.stream.listen(_onCommunicationBlocEvent);
  }


  void addParent() {
    //Add to DB
    var newParent = Parent(id: DB.parents.length + 1, children: []);
    DB.parents.add(newParent);

    var newState = HomeState(
        totalChildren: state.totalChildren,
        parents: List.from(DB.parents.map((parent) => parent.copy()))
    );
    emit(newState);
  }

  void _onCommunicationBlocEvent(CommunicationEvent event){
    switch(event.runtimeType){
      case ChildAddEvent: _onChildAddEvent();
      break;
      case ChildRemoveEvent: _onChildRemoveEvent();
      break;
    }
  }

  _onChildAddEvent() =>
      _countChildren();

  _onChildRemoveEvent() =>
      _countChildren();

  _countChildren(){
    var newState = HomeState(totalChildren:
    DB.parents.expand((parent) => parent.children).toList().length,
        parents: List.from(DB.parents)
    );
    emit(newState);
  }

  @override
  Future<void> close() {
    communicationSubscription.cancel();
    return super.close();
  }
}