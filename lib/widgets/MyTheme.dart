import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
 static ThemeData lighttheme( BuildContext context) => ThemeData(
   fontFamily: GoogleFonts.poppins().fontFamily,
     appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData( color: Colors.grey[700]),
        titleTextStyle: TextStyle(
          color: Colors.grey[700] ,
          fontWeight: FontWeight.bold,
          fontSize: 22,

        )));
     static ThemeData darktheme( BuildContext context) => ThemeData(
       brightness: Brightness.dark ,
     );
  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkBluish = Color(0xff403b58 ) ;
  
  

}