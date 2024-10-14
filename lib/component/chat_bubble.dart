import 'package:flutter/material.dart';
import 'package:my_final_project/services/chat/chat_service.dart';
import 'package:my_final_project/theme/theme_provide.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String messageId;
  final String userId;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    required this.messageId,
    required this.userId,
  });
// show options
  void _showOptions(BuildContext context, String messageId, String userId) {
    showModalBottomSheet(
        context: context,
        builder: (context) { //กำหนกเนื้อหาที่จะแสดง
          return SafeArea( 
              child: Wrap(
            children: [
              // report message
              ListTile(
                leading: Icon(Icons.flag),
                title: Text('Report'),
                onTap: () {
                  Navigator.pop(context);
                  _reportMessage(context, messageId, userId);
                },
              ),
              // block message
              ListTile(
                leading: Icon(Icons.block),
                title: Text('block User'),
                onTap: () {
                  Navigator.pop(context);
                  _blockuser(context, userId);
                  
                },
              ),

              //cancel user
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('Cancel'),
                onTap: () =>Navigator.pop(context),
              ),
            ],
          ));
        });
  }

  // report message
  void _reportMessage(BuildContext context, String messageId, String userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Report Message'),
              content: Text('Are you sure you want report this message?'),
              actions: [
                // cancel buttom
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("cancel"),
                ),
                
                // report buttom
                TextButton(
                  onPressed: () {
                    ChatService().reportUser(messageId, userId);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Message Reported')));
                  },
                  child: Text("Report"),
                )
              ],
            ));
  }
  // block user
  void _blockuser(BuildContext context, String userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Block user'),
              content: Text('Are you sure you want block this user?'),
              actions: [
                // cancle buttom
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("cancel"),
                ),
                // block buttom
                TextButton(
                  onPressed: () {
                    ChatService().blockUser(userId);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('User block!')));
                  },
                  child: Text("Block"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // light vs dark mode for current buble colors
    bool isdarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return GestureDetector(
      onTap: () {
        if (!isCurrentUser) {
          // show option
          _showOptions(context, messageId, userId);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentUser
              ? (isdarkMode
                  ? Color.fromARGB(255, 223, 141, 168)
                  : Theme.of(context).colorScheme.secondary)
              : (isdarkMode ? Colors.grey.shade600 : Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Text(
          message,
          style: TextStyle(
              color: isdarkMode
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
