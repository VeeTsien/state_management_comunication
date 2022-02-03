import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_comunication/presenter/ui/widgets/parent/parent_widget.dart';

import 'home_bloc.dart';
import 'home_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, homeState) {
              return Text('Total children: ${homeState.totalChildren}');
            }
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, homeState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: homeState.parents
                    .map<Widget>((parent) => const ParentWidget()).toList()
                    ..add(const SizedBox(height: 56 + 16)),
                );
              }
            ),
          ),
        ),
        floatingActionButton: const PlusParent()
      ),
    );
  }
}

class PlusParent extends StatelessWidget {
  const PlusParent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<HomeBloc>().addParent(),
      tooltip: 'Increment parent',
      child: const Icon(Icons.add),
    );
  }
}
