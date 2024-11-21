import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_schemes.g.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.arimo().fontFamily,
  colorScheme: _lightColorScheme,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: _lightColorScheme.primary,
    foregroundColor: _lightColorScheme.surface,
    iconTheme: IconThemeData(
      color: _lightColorScheme.surface,
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: _lightColorScheme.surface,
    surfaceTintColor: _lightColorScheme.surface,
  ),
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) => _lightColorScheme.surface,
      ),
      // backgroundColor: MaterialStateProperty.resolveWith(
      //   (states) => _lightColorScheme.onPrimaryContainer,
      // ),
    ),
  ),
);
