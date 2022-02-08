import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_string/random_string.dart';
import 'package:state_management_comunication/domain/entities/child.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/widgets/child/children_cubit.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parents_cubit.dart';

class ParentsBuilder extends StatelessWidget {
  final List<Parent> parents;
  const ParentsBuilder({Key? key, required this.parents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: parents.length * 200,
      child: ListView.builder(
          itemCount: parents.length,
          itemBuilder: (BuildContext context, int idx) {
            Parent parent = parents[idx];
            return BlocProvider(
                create: (context) => ChildrenCubit(
                    selectedParent: parent,
                    parentsCubit: context.read<ParentsCubit>()),
                child: BlocBuilder<ChildrenCubit, ChildrenState>(
                  builder: (context, childrenState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Header(parent: parent),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)),
                            height: childrenState.children.length * 30,
                            child: ListView.builder(
                                itemCount: childrenState.children.length,
                                itemBuilder: (context, idx) {
                                  Child _child = childrenState.children[idx];
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(_child.name),
                                      MinusSign(
                                        onTapped: () => context
                                            .read<ChildrenCubit>()
                                            .removeChild(_child),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  },
                ));
          }),
    );
  }
}

class Header extends StatelessWidget {
  final Parent parent;
  const Header({required this.parent});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MinusSign(
                onTapped: () =>
                    context.read<ParentsCubit>().removeParent(parent: parent)),
            const SizedBox(width: 16),
            Expanded(
                child: Text(
              parent.name,
              style: const TextStyle(color: Colors.white),
            )),
            PlusChild(parent: parent),
          ],
        ));
  }
}

class PlusChild extends StatelessWidget {
  final Parent parent;
  PlusChild({Key? key, required this.parent}) : super(key: key);

  final TextEditingController _childNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int _randomID =
        int.parse(parent.id.toString() + randomBetween(0, 10000).toString());

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Form(
                    child: TextFormField(
                  controller: _childNameController,
                  decoration: const InputDecoration(
                    hintText: 'Child Name',
                  ),
                )),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.read<ChildrenCubit>().addChild(Child(
                            parentID: parent.id,
                            name: _childNameController.text,
                            uID: _randomID));
                        Navigator.pop(context);
                      },
                      child: Text('done'))
                ],
              );
            });
      },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(4.0),
        child: const Icon(
          Icons.add,
          size: 16,
        ),
      ),
    );
  }
}

class MinusSign extends StatelessWidget {
  final VoidCallback onTapped;
  const MinusSign({Key? key, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(4.0),
        child: const Icon(
          Icons.remove,
          size: 16,
        ),
      ),
    );
  }
}
