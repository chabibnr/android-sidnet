import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputDecoration {
  Color borderValid;
  Color borderInvalid;
  double borderWidth;
  double borderRadius;

  CustomInputDecoration({
    this.borderValid = Colors.transparent,
    this.borderInvalid = const Color(0xFFFF3232),
    this.borderWidth = 2,
    this.borderRadius = 8,
  });

  InputDecoration filled(bool isValid, {IconData? prefixIcon, String? labelText}) {
    return InputDecoration(
      filled: true,
      isDense: false,
      labelText: labelText,
      fillColor: isValid ? Colors.white : Colors.red.withOpacity(.2),
      contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
      prefixIcon: prefixIcon == null
          ? null
          : Icon(
              prefixIcon,
              color: isValid ? Colors.black : Colors.red.withOpacity(.5),
              //size: 25,
            ),
      hintStyle: TextStyle(
        color: isValid ? Colors.black : Colors.red.withOpacity(.5),
      ),
      border: _inputBorder(isValid),
      focusedBorder: _inputBorder(isValid),
      enabledBorder: _inputBorder(isValid),
    );
  }

  OutlineInputBorder _inputBorder(bool isValid) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: borderWidth,
        color: isValid ? borderValid : borderInvalid,
      ),
    );
  }

  InputDecoration floating(String label) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      labelText: label,
      labelStyle: GoogleFonts.raleway(
        color: const Color(0xFF444444),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      fillColor: const Color(0xFFFCFCFC),
      filled: true,
      hintText: '',
      hintStyle: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorSchema.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }
}
