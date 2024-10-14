import 'package:flutter/material.dart';
import 'package:my_final_project/component/user_tile.dart';
import 'package:my_final_project/services/auth/auth_service.dart';
import 'package:my_final_project/services/chat/chat_service.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({super.key});
  // chat & auth service
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();
  // show confirm unblock box
  void _showUnblockBox(BuildContext context, String userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Unblock User"),
              content: Text("Are you sure you want unblock this user?"),
              actions: [
                // cancle button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("cancel"),
                ),

                // Unblock button
                TextButton(onPressed: (){
                  chatService.unblockUser(userId);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:const Text("User unblocked!")));
                }, child: Text("Unblock"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get current user id
    String userId = authService.getCurrentUser()!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOCKED USERS"),
        actions: [],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: chatService.getBlockedUsersStream(userId),
          builder: (context, snapshot) {
            // error
            if (snapshot.hasError) {
              return Center(
                child: Text("Error loading.."),
              );
            }
            // loading..
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final blockedUsers = snapshot.data ?? [];
            // no users
            if (blockedUsers.isEmpty) {
              return Center(
                child: Text("No blocked Users"),
              );
            }
            // load complete
            return ListView.builder(
              itemCount: blockedUsers.length ,
              itemBuilder: (context, index) {
                final user = blockedUsers[index];
                return UserTile(
                  text: user["email"],
                  ontap: () => _showUnblockBox(context, user['uid']),
                );
              },
            );
          }),
    );
  }
}
