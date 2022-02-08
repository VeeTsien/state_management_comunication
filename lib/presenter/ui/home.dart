import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parent_widget.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parents_cubit.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parents_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var _totalChildren = 0.0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentsCubit, ParentsState>(
      builder: (context, parentsState) {
        parentsState.parents.forEach((parent) {
          _totalChildren += parent.children.length;
        });
        return Scaffold(
            appBar: AppBar(
              title: Text('Total children: $_totalChildren'),
            ),
            body: Center(
              child: ParentsBuilder(
                parents: parentsState.parents,
              ),
            ),
            floatingActionButton: const PlusParent());
      },
    );
  }
}

class PlusParent extends StatelessWidget {
  const PlusParent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _id = random(1, 100000000);
    return FloatingActionButton(
      onPressed: () {
        context
            .read<ParentsCubit>()
            .addParent(parent: Parent(id: _id, name: _id.toString()));
      },
      tooltip: 'Increment parent',
      child: const Icon(Icons.add),
    );
  }
}

int random(min, max) {
  return min + math.Random().nextInt(max - min);
}
