import 'package:state_management_comunication/domain/entities/child.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';

class DB {
  static DB? _instance;

  DB._internal();

  factory DB() => _instance ??= DB._internal();

  final parents = <Parent>[
    Parent(
        id: 0,
        children: [Child(parentID: 0, name: 'initChild', uID: 0)],
        name: 'init')
  ];
}
