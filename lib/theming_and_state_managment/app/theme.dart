import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF5638B);
}

final deliveryGradient = [DeliveryColors.green, DeliveryColors.purple];

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DeliveryColors.white,
    //textTheme: ,
  ),
  canvasColor: DeliveryColors.white,
  accentColor: DeliveryColors.purple,
  bottomAppBarColor: DeliveryColors.veryLightGrey,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: DeliveryColors.purple),
    border: _borderLight(),
    enabledBorder: _borderLight(),
    focusedBorder: _borderLight(),
    contentPadding: EdgeInsets.zero,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.lightGrey,
      fontSize: 10,
    ),
  ),
  iconTheme: IconThemeData(color: DeliveryColors.purple),
);
final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DeliveryColors.purple,
  ),
  canvasColor: DeliveryColors.grey,
  scaffoldBackgroundColor: DeliveryColors.dark,
  accentColor: DeliveryColors.white,
  bottomAppBarColor: Colors.transparent,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.white,
    displayColor: DeliveryColors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: DeliveryColors.green),
    border: _borderDark(),
    enabledBorder: _borderDark(),
    focusedBorder: _borderDark(),
    contentPadding: EdgeInsets.zero,
    fillColor: DeliveryColors.grey,
    filled: true,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.white,
      fontSize: 10,
    ),
  ),
  iconTheme: IconThemeData(color: DeliveryColors.white),
);

OutlineInputBorder _borderLight() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: DeliveryColors.veryLightGrey,
      width: 2,
      style: BorderStyle.solid,
    ),
  );
}

OutlineInputBorder _borderDark() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: DeliveryColors.grey,
      width: 2,
      style: BorderStyle.solid,
    ),
  );
}
