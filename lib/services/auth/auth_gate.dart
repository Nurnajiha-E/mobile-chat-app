import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/services/auth/login_or_register.dart';
import 'package:my_final_project/pages/homepage.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is login
            if(snapshot.hasData){
              return  Homepage();
            }
            // user is NOT login
            else{
              return const LoginOrRegister();
            }
          }),
    );
  }
}
