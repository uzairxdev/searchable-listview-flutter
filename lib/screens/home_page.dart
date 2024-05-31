// screens/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users_provider.dart';
import '../widgets/user_list_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: SizedBox(
          height: 38,
          child: TextField(
            onChanged: (value) =>
                Provider.of<UserProvider>(context, listen: false)
                    .onSearch(value),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[850],
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              hintText: "Search users",
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade900,
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return userProvider.foundedUsers.isNotEmpty
                ? ListView.builder(
                    itemCount: userProvider.foundedUsers.length,
                    itemBuilder: (context, index) {
                      return UserListItem(
                          user: userProvider.foundedUsers[index]);
                    },
                  )
                : const Center(
                    child: Text("No users found",
                        style: TextStyle(color: Colors.white)),
                  );
          },
        ),
      ),
    );
  }
}
