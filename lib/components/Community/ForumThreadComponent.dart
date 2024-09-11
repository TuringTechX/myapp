import 'package:flutter/material.dart';

class ForumThreadComponent extends StatelessWidget {
  final String threadTitle;
  final String threadDescription;
  final int replyCount;

  ForumThreadComponent({required this.threadTitle, required this.threadDescription, required this.replyCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(threadTitle),
        subtitle: Text(threadDescription),
        trailing: Chip(label: Text('$replyCount replies')),
        onTap: () {
          // Navigate to the thread details
        },
      ),
    );
  }
}
