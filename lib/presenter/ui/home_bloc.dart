import 'package:bloc/bloc.dart';
import 'package:state_management_comunication/domain/entities/child.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {

  HomeBloc() : super(HomeState(parents: [Parent()]));

  void addParent() =>
    emit(state.addParent());

}