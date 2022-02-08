import 'package:state_management_comunication/domain/entities/parent.dart';

class ParentsState {
  final List<Parent> parents;

  const ParentsState({this.parents = const []});

  @override
  String toString() {
    return 'ParentsState{parents: $parents}';
  }
}
