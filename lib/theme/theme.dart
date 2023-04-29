import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:material_color_utilities/material_color_utilities.dart';

@immutable
class AppTheme { 
// extends ThemeExtension<AppTheme> 
  const AppTheme({
    this.primaryColor = const Color(0xFF356859),
    this.tertiaryColor = const Color(0xFFFF5722),
    this.neutralColor = const Color(0xFFFFFBE6),
  });

  final Color primaryColor, tertiaryColor, neutralColor;

  ThemeData toThemeData() {
    return ThemeData(useMaterial3: true);
  }

  // ThemeData _base(ColorScheme colorScheme) {
  //   final isLight = colorScheme.brightness == Brightness.light;
  //   final primaryTextTheme = GoogleFonts.lektonTextTheme();
  //   final secondaryTextTheme = GoogleFonts.montserratTextTheme();
  //   final textTheme = primaryTextTheme.copyWith(
  //       displaySmall: secondaryTextTheme.displaySmall);

  //   return ThemeData(
  //     textTheme: textTheme,
  //     useMaterial3: true,
  //     extensions: [this],
  //     colorScheme: colorScheme,
  //     scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background
  //   );
  // }

  // @override
  // ThemeExtension<AppTheme> copyWith({
  //   Color? primaryColor,
  //   Color? tertiaryColor,
  //   Color? neutralColor,
  // }) =>
  //     AppTheme(
  //       primaryColor: primaryColor ?? this.primaryColor,
  //       tertiaryColor: tertiaryColor ?? this.tertiaryColor,
  //       neutralColor: neutralColor ?? this.neutralColor,
  //     );

  // @override
  // AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
  //   if (other is! AppTheme) return this;
  //   return AppTheme(
  //       primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
  //       tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
  //       neutralColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!);
  // }
}
