import 'package:equatable/equatable.dart';

import 'child.dart';

class Parent extends Equatable {
  final int id;
  final String name;
  final List<Child> _children;

  get children => _children;

  Parent({required this.id, required this.name, List<Child>? children})
      : _children = children ??= [];

  Parent copy() => Parent(id: id, children: List.of(_children), name: name);

  @override
  List<Object> get props => [id, name, _children];

  @override
  String toString() {
    return 'Parent{id: $id, name: $name, _children: $_children}';
  }
}
