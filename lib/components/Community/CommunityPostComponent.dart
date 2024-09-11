import 'package:flutter/material.dart';

class CommunityPostComponent extends StatelessWidget {
  final String postTitle;
  final String postContent;
  final String author;

  CommunityPostComponent({required this.postTitle, required this.postContent, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(postTitle),
        subtitle: Text(postContent),
        leading: CircleAvatar(child: Text(author[0])),
        onTap: () {
          // Navigate to post details
        },
      ),
    );
  }
}
