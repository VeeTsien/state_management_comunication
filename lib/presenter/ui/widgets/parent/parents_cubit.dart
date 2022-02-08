import 'package:bloc/bloc.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parents_state.dart';

class ParentsCubit extends Cubit<ParentsState> {
  late final List<Parent> parentsRepo;

  ParentsCubit({required this.parentsRepo}) : super(const ParentsState());

  void addParent({required Parent parent}) {
    parentsRepo.add(parent);
    emit(ParentsState(parents: parentsRepo));
  }

  void removeParent({required Parent parent}) {
    parentsRepo.remove(parent);
    emit(ParentsState(parents: parentsRepo));
  }

  void updateParents(Parent newParent) {
    Parent? _originalParent;
    parentsRepo.map((parent) =>
        parent.id == newParent.id ? _originalParent = parent : null);

    if (_originalParent != null) {
      removeParent(parent: _originalParent!);
      addParent(parent: newParent);
    } else {
      throw 'Parent $_originalParent doens\'t exist.';
    }
  }

  @override
  String toString() {
    return 'ParentsCubit{parentsRepo: $parentsRepo}';
  }
}
