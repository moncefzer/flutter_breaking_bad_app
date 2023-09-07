import 'package:breaking_bad_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorsManager.primary,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w700,
    ),
    titleSpacing: 0,
  ),
  scaffoldBackgroundColor: Colors.grey,
  primarySwatch: ColorsManager.primary,
);
ThemeData darkTheme = ThemeData();
