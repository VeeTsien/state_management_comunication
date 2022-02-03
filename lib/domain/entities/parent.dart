import 'child.dart';

class Parent {
  final List<Child> children;

  Parent({this.children = const []});

  addChild(){
    children.add(const Child());
  }

  Parent copy() =>
    Parent(children: List.of(children));
}