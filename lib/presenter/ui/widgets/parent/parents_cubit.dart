import 'package:bloc/bloc.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parents_state.dart';

class ParentsCubit extends Cubit<ParentsState> {
  late final List<Parent> parentsRepo;

  ParentsCubit({required this.parentsRepo})
      : super(ParentsState(parents: parentsRepo));

  void addParent({required Parent parent}) {
    parentsRepo.add(parent);
    emit(ParentsState(parents: parentsRepo));
  }

  void removeParent({required Parent parent}) {
    parentsRepo.remove(parent);
    emit(ParentsState(parents: parentsRepo));
  }

  void updateParents(Parent newParent) {
    bool parentExists =
        parentsRepo.map((parent) => parent.id).toList().contains(newParent.id);

    print(parentsRepo.map((parent) => parent.id).toList());

    if (parentExists) {
      parentsRepo.forEach((parent) {
        if (parent.id == newParent.id) {
          parentsRepo.remove(parent);
          addParent(parent: newParent);
        }
      });
    } else {
      throw 'Parent doens\'t exist.';
    }
  }

  @override
  String toString() {
    return 'ParentsCubit{parentsRepo: $parentsRepo}';
  }
}
