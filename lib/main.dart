// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/services/auth/auth_gate.dart';
import 'package:my_final_project/firebase_options.dart';
import 'package:my_final_project/theme/theme_provide.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // var app = runApp(MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ส่งค่ากลับมา
    return MaterialApp(
      title: "My app",
      debugShowCheckedModeBanner: false,
      home: //Homepage(),
          AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      
    );
  }
}
