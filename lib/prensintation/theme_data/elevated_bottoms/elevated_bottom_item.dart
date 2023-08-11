import 'package:flutter/material.dart';

class ElevatedBottomStyleItem {
  static ButtonStyle items(
      { IconData? icons, required double size,Color? color}) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minimumSize: Size(0, size),
    );
  }
}
