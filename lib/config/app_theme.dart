import 'package:app/config/color_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      textTheme: GoogleFonts.nunitoTextTheme(),
      primaryColor: ColorConfig.primary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: true,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          minimumSize: const Size(double.minPositive, 50),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    );
  }
}
