import 'package:equatable/equatable.dart';

import 'child.dart';

class Parent extends Equatable {
  final int id;
  final String name;
  final List<Child> _children;

  get children => _children;

  Parent({required this.id, required this.name, List<Child>? children})
      : _children = children ??= [];

  @override
  List<Object> get props => [id, name, _children];

  @override
  String toString() {
    return 'Parent{id: $id, name: $name, _children: $_children}';
  }

  Parent copyWith({
    int? id,
    String? name,
    List<Child>? children,
  }) {
    return Parent(
      id: id ?? this.id,
      name: name ?? this.name,
      children: children ?? this._children,
    );
  }
}
