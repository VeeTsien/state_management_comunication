import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_comunication/domain/entities/child.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/widgets/child/children_cubit.dart';

import '../../home.dart';

class ParentsBuilder extends StatelessWidget {
  final List<Parent> parents;
  const ParentsBuilder({Key? key, required this.parents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: ListView.builder(
          itemCount: parents.length,
          itemBuilder: (BuildContext context, int idx) {
            Parent parent = parents[idx];
            return BlocProvider(
                create: (context) => ChildrenCubit(selectedParent: parent),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: BlocBuilder<ChildrenCubit, ChildrenState>(
                    builder: (context, childrenState) {
                      return Column(
                        children: [
                          Header(parent: parent),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: ListView.builder(
                                itemCount: childrenState.children.length,
                                itemBuilder: (context, idx) {
                                  Child _child = childrenState.children[idx];
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(_child.name),
                                      MinusChild(child: _child),
                                    ],
                                  );
                                }),
                          )
                        ],
                      );
                    },
                  ),
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
          children: [
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
        int.parse(parent.id.toString() + random(2, 10000).toString());

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
        margin: const EdgeInsets.only(bottom: 1, right: 1),
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: const Icon(
          Icons.add,
          size: 16,
        ),
      ),
    );
  }
}

class MinusChild extends StatelessWidget {
  final Child child;
  const MinusChild({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ChildrenCubit>().removeChild(child),
      child: Container(
        margin: const EdgeInsets.only(bottom: 1),
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: const Icon(
          Icons.remove,
          size: 16,
        ),
      ),
    );
  }
}
