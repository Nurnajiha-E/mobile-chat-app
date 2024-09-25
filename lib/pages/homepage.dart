import 'package:flutter/material.dart';
import 'package:my_final_project/component/my_drawer.dart';
// import 'package:my_final_project/component/new_drawer.dart';
import 'package:my_final_project/component/user_tile.dart';
import 'package:my_final_project/pages/chat_page.dart';
import 'package:my_final_project/services/auth/auth_service.dart';
import 'package:my_final_project/services/chat/chat_service.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(
              fontSize: 28.0,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a list of User except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStreamExcludingBlocked(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }
        // return Listview
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display all user ecept current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        ontap: () {
          // tap on a user => go to chat page
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
