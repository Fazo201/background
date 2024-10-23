import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "color_schema.dart";

@immutable
final class AppThemes {
  final ThemeMode mode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;

  AppThemes({required this.mode})
      : darkTheme = ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkColorScheme,
          scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 41),
          // textTheme: const AppTextStyle(),
        ),
        lightTheme = ThemeData(
          brightness: Brightness.light,
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: Colors.white,
          // textTheme: const AppTextStyle(),
        );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      );

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 41),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 18, 18, 41),
        ),
      );

  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }
}
