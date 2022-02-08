import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_string/random_string.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  double _totalChildren = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentsCubit, ParentsState>(
      builder: (context, parentsState) {
        _totalChildren = 0.0;
        parentsState.parents.forEach((parent) {
          _totalChildren += parent.children.length;
        });
        return Scaffold(
            appBar: AppBar(
              title: Text('Total children: $_totalChildren'),
            ),
            body: Align(
              alignment: Alignment.topCenter,
              child: ParentsBuilder(
                parents: parentsState.parents,
              ),
            ),
            floatingActionButton: PlusParent());
      },
    );
  }
}

class PlusParent extends StatelessWidget {
  PlusParent({Key? key}) : super(key: key);

  int _id = randomBetween(0, 10000);

  @override
  Widget build(BuildContext context) {
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
