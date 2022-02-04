import 'package:bloc/bloc.dart';
import 'package:state_management_comunication/data/memory_db.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parent_state.dart';
import 'package:collection/collection.dart';

class ParentBloc extends Cubit<ParentState> {

  ParentBloc._(parent) : super(ParentState(parent: parent.copy()));

  static final List<ParentBloc> _instances = [];

  factory ParentBloc.getInstance(Parent parent){
    var instance = _instances.firstWhereOrNull((instance) => instance.state.parent == parent);
    if(instance == null){
      instance = ParentBloc._(parent);
      _instances.add(instance);
    }
    return instance;
  }

  void addChild() {
    //Add to DB
    var parent = DB.parents.firstWhere((parent) => parent == state.parent);
    parent.addChild();

    var newState = state.copyWith(parent: parent.copy());
    emit(newState);
  }

  void removeChild() {
    //Add to DB
    var parent = DB.parents.firstWhere((parent) => parent == state.parent);
    parent.removeChild();

    var newState = state.copyWith(parent: parent.copy());
    emit(newState);
  }
}