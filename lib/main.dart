import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/theme_screen.dart';
import 'theme/app_themes.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _currentTheme = AppThemes.dreamyPastels;
  int _currentIndex = 0;

  void _changeTheme(ThemeMode mode) {
    setState(() {
      if (mode == ThemeMode.light) {
        _currentTheme = AppThemes.dreamyPastels;
      } else if (mode == ThemeMode.dark) {
        _currentTheme = AppThemes.mysticDeep;
      } else {
        _currentTheme = AppThemes.earthyWarm;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Hobby Recommender',
      theme: _currentTheme,
      home: Scaffold(
        body: _currentIndex == 0
            ? const HomeScreen()
            : ThemeScreen(onThemeChange: _changeTheme),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
