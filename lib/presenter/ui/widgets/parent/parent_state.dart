import 'package:state_management_comunication/domain/entities/parent.dart';

class ParentState{
  final Parent parent;

  ParentState({required this.parent});

  ParentState copyWith({
    Parent? parent
  }) {
    return ParentState(parent: parent ?? this.parent.copy());
  }
}