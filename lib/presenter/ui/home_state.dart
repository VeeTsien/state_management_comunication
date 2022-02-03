import 'package:state_management_comunication/domain/entities/parent.dart';

class HomeState {

  final int totalChildren;
  final List<Parent> parents;

  HomeState({this.totalChildren = 0, this.parents = const []});

  HomeState addParent() =>
    HomeState(totalChildren: totalChildren, parents: List.from(parents)..add(Parent()));

  HomeState onNewChildren() {
    return HomeState(totalChildren:
      parents.expand((parent) => parent.children).toList().length,
      parents: List.from(parents)
    );
  }
}