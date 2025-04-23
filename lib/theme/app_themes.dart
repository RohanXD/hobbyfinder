import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final ThemeData dreamyPastels = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFCF2),
    primaryColor: const Color(0xFFCDB4DB),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFCDB4DB)),
    textTheme: GoogleFonts.poppinsTextTheme(),
    cardColor: const Color(0xFFFFC8DD),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBDE0FE),
      ),
    ),
  );

  static final ThemeData earthyWarm = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFCF2),
    primaryColor: const Color(0xFFEB5E28),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFCCC5B9)),
    textTheme: GoogleFonts.loraTextTheme(),
    cardColor: const Color(0xFFCCC5B9),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEB5E28),
      ),
    ),
  );

  static final ThemeData mysticDeep = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF062726),
    primaryColor: const Color(0xFFA06CD5),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF102B3F)),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    cardColor: const Color(0xFF6247AA),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFA06CD5),
      ),
    ),
  );
}
