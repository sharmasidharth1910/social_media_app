import 'package:flutter/material.dart';
import 'package:socialmediaapp/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
