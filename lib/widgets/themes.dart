import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      accentColor: MyTheme.darkBluishColor,
      buttonColor: darkBluishColor,
      appBarTheme: AppBarTheme(
          color: MyTheme.creamColor,
          elevation: 0.0,
          foregroundColor: MyTheme.darkCreamColor,
          iconTheme: IconThemeData(color: MyTheme.darkBluishColor),
          textTheme: Theme.of(context).textTheme)

      // textTheme: Theme.of(context)
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        brightness: Brightness.dark,
        accentColor: Colors.white,
        buttonColor: lightBluishColor,
        appBarTheme: AppBarTheme(
          color: MyTheme.darkCreamColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme,
          // textTheme:
        ),
      );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
