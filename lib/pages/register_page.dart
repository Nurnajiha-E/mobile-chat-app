// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_final_project/services/auth/auth_service.dart';
import 'package:my_final_project/component/my_button.dart';
import 'package:my_final_project/component/my_textfield.dart';

class RegisterPage extends StatelessWidget {
// email and pw controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _cfpwController = TextEditingController();
// tap tp gp login page

  final void Function()? onTap;
//login method
  void register(BuildContext context) {
    // get auth servuce
    final _auth = AuthService();
    // password match --> create user
    if(_pwController.text == _cfpwController.text){
      try{
        _auth.signUpWithEmailPassword(
          _emailController.text, 
          _pwController.text);
      }catch(e){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
      }
    }
    // if password dont match --> tell user to fix
    else{
      showDialog(
          context: context,
          builder: (context) =>  AlertDialog(
                title: Text("Password uncorrect"),
              ));
    }
  }

  RegisterPage({super.key, required this.onTap});

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
              Icons.account_circle,
              size: 70,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 40), //สร้างช่องว่าง

            // wellcome back message
            Text(
              "Let's create an accout for you!",
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

            //confirm password textfield
            MyTextfield(
              hintText: "Confirm your Password...",
              obscuerText: true,
              controller: _cfpwController,
            ),

            const SizedBox(height: 15),

            // login button
            MyButton(
              text: "Create",
              onTap: () => register(context),
            ),

            const SizedBox(height: 15),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an accout?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login now",
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
