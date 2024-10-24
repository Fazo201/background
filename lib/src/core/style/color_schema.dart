import "package:flutter/material.dart" show ColorScheme, Brightness, Color;

const ColorScheme lightColorScheme = ColorScheme(

  brightness: Brightness.light,

  primary: Color.fromARGB(255, 0, 145, 255),  //
  onPrimary: Color(0xFFFFFFFF), 
  primaryContainer: Color(0xFF71B1A1), 
  secondary: Color.fromARGB(255, 0, 213, 255), //
  secondaryContainer: Color(0xFFFFAD30), 
  surface: Color(0xFFFFFFFF), 
  surfaceDim: Color(0xFF000000), 
  onSurface: Color(0xFF121212), 
  surfaceBright: Color(0xFFD9D9D9), 
  outline: Color(0xFFD9D9D9),
  errorContainer: Color(0xFFFD3654), 
  onErrorContainer: Color(0xFFFFE1E7),
  inverseSurface: Color.fromRGBO(0, 0, 0, 1),
  shadow: Color.fromARGB(255, 200, 200, 200),

  ///Don't need ones!!!
  onSecondary: Color(0xFF000000),
  error: Color(0xFF000000),
  onError: Color(0xFF000000),
  // secondaryContainer: Color(0xffffffff),
  // onSecondaryContainer: Color(0xff141414),
  // tertiary: Color(0xff141311),
  // onTertiary: Color(0xff000000),
  // tertiaryContainer: Color(0xffEDEDED),
  // onTertiaryContainer: Color(0xff141413),
  // onPrimaryContainer: Color(0xff141311),
  // surfaceContainerHighest: Color(0xffeee8e3),
  // onSurfaceVariant: Color(0xff121211),
  // outline: Color(0xff837676),
  // outlineVariant: Color(0xffccc6c6),
  // shadow: Color(0xff000000),
  // scrim: Color(0xff000000),
  // inverseSurface: Color(0xff171411),
  // onInverseSurface: Color(0xfff5f5f5),
  // inversePrimary: Color(0xfffff8c0),
  // surfaceTint: Color(0xff3F3F3F),
);

const ColorScheme darkColorScheme = ColorScheme(

  brightness: Brightness.dark,

  primary: Color.fromARGB(255, 0, 4, 211), ///003f22 For main components on UI!
  onPrimary: Color(0xFFcdcde9), ///cdcde9 For items ex. icons, texts on main components on UI!
  secondary: Color.fromARGB(255, 0, 113, 194), ///a47618
  secondaryContainer: Color(0xFFFFAD30), ///FFAD30
  surface: Color.fromARGB(255, 0, 32, 69), ///001125 For backgrounds of (Scaffold, app, ...).
  onSurface: Color(0xffeceded),
  shadow: Color.fromARGB(255, 96, 96, 96),

  ///Don't need ones!!!
  onSecondary: Color(0xff141210),
  error: Color(0xFF000000),
  onError: Color(0xFF000000),
  // secondaryContainer: Color(0xff6C7882),
  // onSecondaryContainer: Color(0xfff3e6e2),
  // tertiary: Color(0xff141311),
  // onTertiary: Color(0xff131414),
  // primaryContainer: Color(0xff141311),
  // tertiaryContainer: Color(0xff6C7882),
  // onTertiaryContainer: Color(0xffeaf7fb),
  // errorContainer: Color(0xffb1384e),
  // onPrimaryContainer: Color(0xffe9ecf1),
  // onErrorContainer: Color(0xfffbe8ec),
  // surfaceContainerHighest: Color(0xff3d4146),
  // onSurfaceVariant: Color(0xffe0e1e1),
  // outline: Color(0xff767d7d),
  // outlineVariant: Color(0xff2c2e2e),
  // shadow: Color(0xff000000),
  // scrim: Color(0xff000000),
  // inverseSurface: Color(0xfffafcff),
  // onInverseSurface: Color(0xff131314),
  // inversePrimary: Color(0xff536577),
  // surfaceTint: Color(0xffffffff),
);
