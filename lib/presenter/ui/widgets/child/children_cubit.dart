import 'package:bloc/bloc.dart';
import 'package:state_management_comunication/domain/entities/child.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';

part 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  final Parent selectedParent;

  ChildrenCubit({required this.selectedParent})
      : super(const ChildrenState(children: []));

  void addChild(Child child) async {
    await selectedParent.children.add(child);
    emit(ChildrenState(children: selectedParent.children));
  }

  void removeChild(Child child) async {
    await selectedParent.children.remove(child);
    emit(ChildrenState(children: selectedParent.children));
  }

  void updateChild(Child newChild) {
    Child? _originalChild;
    selectedParent.children.map((child) =>
        child.parentID == newChild.parentID && child.uID == newChild.uID
            ? _originalChild = child
            : null);

    if (_originalChild != null) {
      removeChild(_originalChild!);
      addChild(newChild);
    } else {
      throw 'Child $_originalChild doens\'t exist.';
    }
  }

  @override
  String toString() {
    return 'ChildrenCubit{selectedParent: $selectedParent}';
  }
}
