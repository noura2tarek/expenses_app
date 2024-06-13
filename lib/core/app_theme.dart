import 'package:flutter/material.dart';

var myColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
var myDarkColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

/*------------- light theme--------------*/
var lightTheme = ThemeData(useMaterial3: true).copyWith(
  colorScheme: myColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: myColorScheme.onPrimaryContainer,
    foregroundColor: myColorScheme.primaryContainer,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardTheme().copyWith(
    color: myColorScheme.secondaryContainer,
    margin: EdgeInsets.only(right: 10, left: 10, top: 10),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myColorScheme.primaryContainer,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          color: myColorScheme.onSecondaryContainer,
        ),
      ),
);

/*------------- Dark theme--------------*/
var darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: myDarkColorScheme.onSecondaryContainer,
  colorScheme: myDarkColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: myDarkColorScheme.onPrimaryContainer,
    foregroundColor: myDarkColorScheme.primaryContainer,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: myDarkColorScheme.primaryContainer),
  ),
  cardTheme: CardTheme().copyWith(
    color: myDarkColorScheme.secondaryContainer,
    margin: EdgeInsets.only(right: 10, left: 10, top: 10),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myDarkColorScheme.primaryContainer,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          color: myDarkColorScheme.onSecondaryContainer,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: myDarkColorScheme.primaryContainer,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: myDarkColorScheme.primaryContainer,
        ),
      ),
  bottomSheetTheme: BottomSheetThemeData().copyWith(
    backgroundColor: myDarkColorScheme.onPrimaryContainer,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 15.0,
      color: myDarkColorScheme.primaryContainer,
    ),
  ),
);
