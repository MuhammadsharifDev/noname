import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextItems {
  static InputDecoration item({
    required IconData icons,
    required String text,
    IconData? secondIcon,
    Color? color,
  }) {
    return InputDecoration(
      filled: true,
      fillColor:color,
      prefixIcon:Icon(icons,color: Colors.grey,),
      suffixIcon: Icon(secondIcon, color: Colors.grey.withOpacity(0.5),),// Background color
      border: OutlineInputBorder(
          // Border// Border color
          borderRadius: BorderRadius.circular(
            15.0,
          ),
          borderSide: BorderSide.none // Border radius
          ),
      label: Text(
        text,
        style: GoogleFonts.outfit(color: Colors.grey),
      ),

    );
  }
}
