// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 254, 232, 238), //พื้นหลัง
    onSurface:  Color.fromARGB(255, 103, 46, 65), 
    primary: Color.fromARGB(255, 223, 79, 127),  //สีuiหลัก
    secondary: Color.fromARGB(255, 223, 141, 168),  //สี uiรอง
    onSecondary: Color.fromARGB(255, 255, 246, 249),
    tertiary: Color.fromARGB(255, 241, 190, 208),  //สีuiเพิ่มเติม
    inversePrimary: Colors.grey.shade900, //สีข้อความ
    inverseSurface: Color.fromARGB(255, 202, 187, 191)
    
  )
);