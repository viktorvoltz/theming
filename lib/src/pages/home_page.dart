import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/theme_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  // List of items in our dropdown menu
  List<String> items = [
    'light',
    'dark',
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: theme.themeModeValue as String,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                theme.setTheme(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
