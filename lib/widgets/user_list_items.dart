// widgets/user_list_item.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';
import '../providers/users_provider.dart';

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => log("archive"),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.blue,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (context) => log('Share'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.blue,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => log('More'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.blue,
            icon: Icons.more_horiz,
            label: 'More',
          ),
          SlidableAction(
            onPressed: (context) => log('Delete'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(user.image),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text(user.username,
                        style: TextStyle(color: Colors.grey[500])),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Provider.of<UserProvider>(context, listen: false)
                    .toggleFollow(user);
              },
              child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: user.isFollowedByMe ? Colors.blue[700] : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: user.isFollowedByMe
                          ? Colors.transparent
                          : Colors.grey.shade700),
                ),
                child: Center(
                  child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow',
                      style: TextStyle(
                          color: user.isFollowedByMe
                              ? Colors.white
                              : Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
