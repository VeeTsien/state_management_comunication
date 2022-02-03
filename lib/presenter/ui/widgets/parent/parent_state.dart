import 'package:state_management_comunication/domain/entities/parent.dart';

class ParentState{
  final Parent parent;

  ParentState({required this.parent});

  ParentState copy() {
    var copy = parent.copy();
    return ParentState(parent: copy);
  }

  @override
  bool operator ==(Object other) {
    if(other is ParentState == false) return false;
    other as ParentState;
    return parent.children.length == other.parent.children.length;
  }

  @override
  int get hashCode => parent.children.hashCode;
}