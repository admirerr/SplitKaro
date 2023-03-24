import 'package:flutter/material.dart';

class GroupDetailsPage extends StatelessWidget {
  final String groupName;

  const GroupDetailsPage({Key? key, required this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              _showAddMemberDialog(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Details for $groupName'),
      ),
    );
  }

  void _showAddMemberDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Member'),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Enter member name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add member logic here
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
