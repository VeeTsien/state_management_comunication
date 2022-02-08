import 'package:equatable/equatable.dart';

class Child extends Equatable {
  final int parentID;
  final int uID;
  final String name;

  Child({required this.parentID, required this.name, required this.uID});

  @override
  List<Object> get props => [parentID, uID, name];

  @override
  String toString() {
    return 'Child{parentID: $parentID, uID: $uID, name: $name}';
  }
}
