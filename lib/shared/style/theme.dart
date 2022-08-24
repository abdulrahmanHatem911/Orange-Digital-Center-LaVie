import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Color(0xff6F6F6F),
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: Color(0xff8A8A8A),
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 14.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.ubuntu(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.ubuntu(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.ubuntu(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.ubuntu(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: GoogleFonts.ubuntu(
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headline5: GoogleFonts.ubuntu(
      fontSize: 16.0,
      color: Colors.black45,
      fontWeight: FontWeight.w600,
    ),
    headline6: GoogleFonts.ubuntu(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }
}
