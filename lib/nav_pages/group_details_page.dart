import 'package:flutter/material.dart';

class GroupDetailsPage extends StatelessWidget {
  final String groupName;

  const GroupDetailsPage({Key? key, required this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
      body: Center(
        child: Text('Details for $groupName'),
      ),
    );
  }
}
