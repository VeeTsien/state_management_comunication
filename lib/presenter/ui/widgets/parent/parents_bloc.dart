import 'package:bloc/bloc.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parent_state.dart';

class ParentBloc extends Cubit<ParentState> {

  ParentBloc() : super(ParentState(parent: Parent()));

  void addChild() {
    var newState = state.copy();
    newState.parent.addChild();
    emit(newState);
  }

  void removeChild() {
    var newState = state.copy();
    newState.parent.children.removeLast();
    emit(newState);
  }
}