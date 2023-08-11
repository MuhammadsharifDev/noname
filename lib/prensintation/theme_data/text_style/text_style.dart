

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class  TextStyleItems{

  static Text items({required String text,  Color? color,required double size, required var fontWeight}){
    return Text(text,style: GoogleFonts.outfit(color:color,fontSize: size,fontWeight: fontWeight),);

  }
}
