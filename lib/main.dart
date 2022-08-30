import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themeing/src/provider/theme_provider.dart';

import 'src/pages/home_page.dart';

void main() async {
  final pref = await SharedPreferences.getInstance();
  ThemeProvider themeProvider = ThemeProvider(pref);
  themeProvider.assertTheme();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider(pref))],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (ctx, value, child) {
        return MaterialApp(
          theme: value.getTheme(),
          home: const HomePage(),
        );
      },
    );
  }
}
