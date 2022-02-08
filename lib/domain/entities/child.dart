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

  Child copyWith({
    int? parentID,
    int? uID,
    String? name,
  }) {
    return Child(
      parentID: parentID ?? this.parentID,
      uID: uID ?? this.uID,
      name: name ?? this.name,
    );
  }
}
