import 'package:state_management_comunication/domain/entities/child.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';

class DB {
  static final parents = <Parent>[Parent(id: 0, children: [const Child()])];
}