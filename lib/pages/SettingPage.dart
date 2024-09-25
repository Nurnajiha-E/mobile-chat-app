import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/pages/blocked_users_page.dart';
import 'package:my_final_project/theme/theme_provide.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SettingsPage",
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              // Dark mode
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dark Mode"),
                    CupertinoSwitch(
                      value: Provider.of<ThemeProvider>(context, listen: false)
                          .isDarkMode,
                      onChanged: (value) =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(),
                    )
                  ],
                ),
              ),

              // block mode
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bloked users"),
                    IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlockedUsersPage())),
                      icon: Icon(Icons.arrow_forward_sharp,),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Block Users
    );
  }
}
