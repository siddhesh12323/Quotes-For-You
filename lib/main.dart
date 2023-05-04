import 'package:flutter/material.dart';
import 'package:quotes_app/screens/home.dart';
//import 'package:quotes_app/theme/theme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'screens/about.dart';
import 'screens/customize.dart';
import 'screens/favorites.dart';

void main() {
  runApp(const MyApp());
}

Color brandColor = Color.fromARGB(255, 52, 194, 226);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // const appTheme = AppTheme();
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;
      if (lightDynamic != null && dark != null) {
        lightColorScheme = lightDynamic.harmonized()..copyWith();
        lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
        darkColorScheme = dark.harmonized();
      } else {
        lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
        darkColorScheme =
            ColorScheme.fromSeed(seedColor: brandColor, brightness: Brightness.dark);
      }

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quotes For You',
        // theme: appTheme.toThemeData(),
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData.dark(useMaterial3: true),
        //color: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/favorites': (context) => const Favorites(),
          '/customize': (context) => Customize(),
          '/about': (context) => const About(),
        },
      );
    });
  }
}
