// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_final_project/services/auth/auth_service.dart';
import 'package:my_final_project/component/my_button.dart';
import 'package:my_final_project/component/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // email and pw controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

// tap to go register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();
    // try login
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    }
    // catch any errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 40), //สร้างช่องว่าง

            // wellcome back message
            Text(
              "Wellcome back, you have been missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextfield(
              hintText: "Type your Email...",
              obscuerText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 15),

            // password textfield
            MyTextfield(
              hintText: "Type your Password...",
              obscuerText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 15),

            // login button
            MyButton(
              text: "login",
              onTap: () => login(context),
            ),

            const SizedBox(height: 15),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an accout?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Create one",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
