import 'package:android_tv/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Android TV',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Color(0xFF191923)
        ),
        home: Login(),
      ),
    );
  }
}
