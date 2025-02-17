import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/auth/splash_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: LightThemeData(),
    );
  }

  ThemeData LightThemeData() {
    return ThemeData(
      inputDecorationTheme:   InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey.shade400
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none
        )
    ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        letterSpacing: 0.6
      ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          foregroundColor: AppColors.white,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        )
      ),
        textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          textStyle: TextStyle(
            fontWeight: FontWeight.w800
          )
        )
    )
    );
  }
}
