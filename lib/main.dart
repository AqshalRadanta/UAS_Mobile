import 'package:flutter/material.dart';
import 'package:prak_mobile/login_page.dart';
import 'package:prak_mobile/theme/dark_light.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkMode) {
    setState(() {
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();
      SharedPref.pref?.setBool('isDarkMode', isDarkMode);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    bool isDarkMode = SharedPref.pref?.getBool('isDarkMode') ?? false;
    setTheme(isDarkMode);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movielist',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: LoginPage(setTheme: setTheme),
    );
  }
}
