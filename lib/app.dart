import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/match_list_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MatchListScreen(),
      theme: _lightTheme(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(double.maxFinite),
                padding: EdgeInsets.symmetric(vertical: 12)
            )
        )
    );
  }
}