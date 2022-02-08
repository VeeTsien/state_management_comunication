part of 'children_cubit.dart';

class ChildrenState {
  final List<Child> children;
  const ChildrenState({this.children = const <Child>[]});

  @override
  String toString() {
    return 'ChildrenState{children: $children}';
  }
}
