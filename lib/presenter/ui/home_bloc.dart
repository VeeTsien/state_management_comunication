import 'package:bloc/bloc.dart';
import 'package:state_management_comunication/data/memory_db.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {

  HomeBloc() : super(HomeState(parents: DB.parents));

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

  HomeState onNewChildren() {
    return HomeState(totalChildren:
      DB.parents.expand((parent) => parent.children).toList().length,
        parents: List.from(DB.parents.map((parent) => parent.copy()))
    );
  }
}