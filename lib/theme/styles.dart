import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color lightPrimaryColor = Color(0xFFF9F5F1);
const Color lightSecondaryColor = Color(0xff4BCD3E);
const Color lightTextColor = Color(0xff032029);
const Color lightUnselectedColor = Color(0xFF3D4953);
const Color lightBackgroundColor = Color(0xFFF9F5F1);

const Color darkPrimaryColor = Color(0xff032029);
const Color darkSecondaryColor = Color(0xff4BCD3E);
const Color darkTextColor = Color(0xFFF9F5F1);
const Color darkUnselectedColor = Color(0xFFE8DBCB);
const Color darkBackgroundColor = Color(0xFF02181F);

const TextTheme textTheme = TextTheme(
  bodyText1: TextStyle(
    color: lightTextColor,
    fontWeight: FontWeight.normal,
  ),
  headline5: TextStyle(
    fontWeight: FontWeight.bold,
    color: lightTextColor,
    fontSize: 28,
  ),
  headline4: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: lightTextColor,
  ),
);

final buttonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  )),
);

final materialStateColorLight = MaterialStateProperty.all(lightPrimaryColor);

final ThemeData lightTheme = ThemeData(
  canvasColor: lightPrimaryColor,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: lightPrimaryColor,
    secondary: lightSecondaryColor,
  ),
  primaryColorLight: lightPrimaryColor,
  primaryColorDark: lightSecondaryColor,
  scaffoldBackgroundColor: lightBackgroundColor,
  backgroundColor: lightBackgroundColor,
  shadowColor: Colors.black.withOpacity(0.5),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  textTheme: textTheme,
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: buttonStyle.copyWith(
    foregroundColor: materialStateColorLight,
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: buttonStyle.copyWith(
      backgroundColor: materialStateColorLight,
    ),
  ),
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  ),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: lightPrimaryColor,
  ),
);

final ThemeData darkTheme = lightTheme.copyWith(
  canvasColor: darkPrimaryColor,
  colorScheme: const ColorScheme.dark(
    primary: darkPrimaryColor,
    secondary: darkSecondaryColor,
  ),
  primaryColorLight: darkTextColor,
  primaryColorDark: darkTextColor,
  backgroundColor: darkBackgroundColor,
  scaffoldBackgroundColor: darkBackgroundColor,
  textTheme: textTheme.copyWith(
    bodyText1: const TextStyle(
      color: darkTextColor,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: const TextStyle(
      color: darkTextColor,
    ),
    headline4: textTheme.headline4!.copyWith(
      color: darkTextColor,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: lightTheme.outlinedButtonTheme.style!.copyWith(
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
  cardColor: Colors.blueGrey[900],
  iconTheme: IconThemeData(
    color: Colors.blueGrey[200],
  ),
  dialogBackgroundColor: Colors.blueGrey[900],
  inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(
    labelStyle: const TextStyle(
      color: Colors.white70,
    ),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: darkPrimaryColor,
  ),
);
