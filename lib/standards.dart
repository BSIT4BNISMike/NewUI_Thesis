import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Standards {
  // Colors
  static const colors = {
    "primaryColor": Color(0xFFCC90EC),
    "primaryColorLight": Color(0xFFE0B0FF),
    "primaryColorDark": Color(0xFF996EB4),
    "whiteColor": Color(0xFFFFFFFF),
    "blackColor": Color(0xFF000000),
    "grayColor": Color(0xFFE0E0E0),
    "blueColor": Color(0xFF3479d5),
    "backColor": Color(0xFF1b1737),
  };
  static final Textcolor = {
    "keyboardWhite": GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.white,
    ),
  };

  // Bounds
  static const bounds = {
    "margin": 20.00,
    "padding": 16.00,
    "borderRadius": 15.00,
    "minimargin": 10.00,
    "miniborderRadius": 10.00,
  };

  // Fonts
  static final fontStyles = {
    "main": GoogleFonts.poppins(
      fontSize: 24.00,
      fontWeight: FontWeight.bold,
      color: colors["blackColor"],
    ),
    "mainWhite": GoogleFonts.poppins(
      fontSize: 24.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "mainColored": GoogleFonts.poppins(
      fontSize: 24.00,
      fontWeight: FontWeight.bold,
      color: colors["primaryColor"],
    ),
    "miniWhite": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "microWhite": GoogleFonts.poppins(
      fontSize: 17.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "tinyWhite": GoogleFonts.poppins(
      fontSize: 15.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "BigWhite": GoogleFonts.poppins(
      fontSize: 20.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "smallerMain": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["blackColor"],
    ),
    "smallerMainColored": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["primaryColor"],
    ),
    "smallerMainBlue": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["blueColor"],
    ),
    "smallerMainWhite": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "mainGradient": GoogleFonts.poppins(
      fontSize: 16.00,
      fontWeight: FontWeight.bold,
    ),
    "subtitle": GoogleFonts.poppins(
      fontSize: 15.00,
      color: colors["blackColor"],
    ),
    "titlemini": GoogleFonts.poppins(
      fontSize: 15.00,
      color: colors["whiteColor"],
    ),
    "mainButtonWhite": GoogleFonts.poppins(
      fontSize: 30.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "mainButtonColored": GoogleFonts.poppins(
      fontSize: 30.00,
      fontWeight: FontWeight.bold,
      color: colors["primaryColor"],
    ),
    "button": GoogleFonts.poppins(
      fontSize: 14.00,
      fontWeight: FontWeight.bold,
      color: colors["blueColor"],
    ),
    "whitebutton": GoogleFonts.poppins(
      fontSize: 14.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "navigationLabel": GoogleFonts.poppins(
      fontSize: 10.00,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: colors["primaryColorDark"],
    ),
  };
}
