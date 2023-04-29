import 'package:flutter/material.dart';
import 'package:quotes_app/screens/home.dart';
//import 'package:quotes_app/theme/theme.dart';

import 'screens/about.dart';
import 'screens/customize.dart';
import 'screens/favorites.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // const appTheme = AppTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes For You',
      // theme: appTheme.toThemeData(),
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/favorites': (context) => const Favorites(),
        '/customize': (context) => Customize(),
        '/about': (context) => const About(),
      },
    );
  }
}
