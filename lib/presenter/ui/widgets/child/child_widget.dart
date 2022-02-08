import 'package:flutter/material.dart';

class ChildWidget extends StatelessWidget {
  final String childName;
  const ChildWidget({Key? key, required this.childName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(childName);
  }
}
