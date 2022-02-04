import 'package:state_management_comunication/domain/entities/parent.dart';

class HomeState {

  final int totalChildren;
  final List<Parent> parents;

  HomeState({this.totalChildren = 0, required this.parents});
}