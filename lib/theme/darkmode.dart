// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 67, 64, 65), //พื้นหลัง
    onSurface:  Color.fromARGB(255, 255, 246, 249), 
    primary: Color.fromARGB(255, 145, 145, 145),  //สีuiหลัก
    secondary: Color.fromARGB(255, 107, 107, 107),  //สี uiรอง
    onSecondary: Color.fromARGB(255, 255, 246, 249),
    tertiary: Color.fromARGB(255, 181, 176, 177),  //สีuiเพิ่มเติม
    inversePrimary: Colors.grey.shade900, //สีข้อความ
    inverseSurface: Color.fromARGB(255, 202, 187, 191)
    
  )
);