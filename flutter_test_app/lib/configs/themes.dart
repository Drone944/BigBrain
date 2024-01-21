import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

final appTheme = ThemeData(
  primaryColor: kRed,
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: GoogleFonts.comicNeue().fontFamily,
      fontWeight: FontWeight.bold,
    ),
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 58,
      fontFamily: GoogleFonts.comicNeue().fontFamily,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.bangers().fontFamily,
      fontSize: 45,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
);