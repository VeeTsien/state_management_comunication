import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_comunication/domain/entities/parent.dart';
import 'package:state_management_comunication/presenter/ui/widgets/child/child_widget.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parent_state.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parents_bloc.dart';

class ParentWidget extends StatelessWidget {

  final Parent parent;

  const ParentWidget({Key? key, required this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ParentBloc>(
      create: (context) => ParentBloc.getInstance(parent),
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Header(),
            const SizedBox(height: 8),
            BlocBuilder<ParentBloc, ParentState>(
                builder: (context, parentState) {
                  return Column(
                    children: parentState.parent.children.map<Widget>((child) => Row(
                      children: const [
                        SizedBox(width: 36),
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: ChildWidget(),
                        ),
                      ],
                    )).toList(),
                  );
                }
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Row(
          children: const [
            SizedBox(width: 16),
            Expanded(child: Text('Parent', style: TextStyle(color: Colors.white),)),
            PlusChild(),
            MinusChild(),
          ],
        )
    );
  }
}



class PlusChild extends StatelessWidget {
  const PlusChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ParentBloc>().addChild(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 1, right: 1),
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: const Icon(Icons.add, size: 16,),
      ),
    );
  }
}

class MinusChild extends StatelessWidget {
  const MinusChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ParentBloc>().removeChild(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 1),
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: const Icon(Icons.remove, size: 16,),
      ),
    );
  }
}