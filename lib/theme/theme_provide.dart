import 'package:flutter/material.dart';
import 'package:my_final_project/theme/darkmode.dart';
import 'package:my_final_project/theme/lightmode.dart';
class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode; //เปลี่ยนค่าset
    }else{
      themeData = lightMode; //เปลี่ยนค่าset
    }
  }
}