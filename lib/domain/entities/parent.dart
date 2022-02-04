import 'child.dart';

class Parent {
  final int id;
  final List<Child> _children;
  get children => _children;

  Parent({required this.id, List<Child>? children}):
    _children = children ??= [];

  addChild(){
    _children.add(const Child());
  }

  removeChild(){
    if(_children.isNotEmpty) {
      _children.removeLast();
    }
  }

  Parent copy() =>
    Parent(id: id, children: List.of(_children));

  @override
  bool operator ==(Object other) {
    if(other is Parent == false) return false;
    other as Parent;
    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}