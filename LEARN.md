## key code

in `main()` and before `runApp()` is loaded, a single instance of `SharedPreferences` (none is created again thoughout the app) is gotten and passed into `ThemeProvider`. This is bacause it is imperative to acquire the last/previous theme state before loading the app. yes, `themeProvider.assertTheme()`.

```dart
final pref = await SharedPreferences.getInstance();
  ThemeProvider themeProvider = ThemeProvider(pref);
  themeProvider.assertTheme();
```

the key to retaining the value of `themeProvider.assertTheme()` is assigning relevant data it to a `static` variable.
```dart
static ThemeData? _themeData;
```
`_themeData` retains its value through the creation and recreation of the `ThemeProvider` object in app's lifecycle.

in what is relevant here, our variable of type `ThemeData` will work our trick.
