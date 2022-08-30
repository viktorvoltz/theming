# theming

This is an *opinionated* and effective way to provide multi-theme choice for your app.

![themes](https://user-images.githubusercontent.com/45709308/187513887-f14ad4ab-c99d-413f-a7dc-0e05d5782110.gif)

theming depends on `provider` and `shared_preference` for state management and data retention respectively.

theming solves the issue of ** loading a default theme ** on the app startup before fetching last theme state from shared pref. After seeing this issue from in two public articles, i decided to give it a try :shipit:

## key code

in `main()` and before `runApp()` is loaded, a single instance of `SharedPreferences` (none is created again thoughout the app) is gotten and passed into `ThemeProvider`. This is bacause it is imperative to acquire the last/previous theme state before loading the app. yes, `themeProvider.assertTheme()`.

```dart
final pref = await SharedPreferences.getInstance();
  ThemeProvider themeProvider = ThemeProvider(pref);
  themeProvider.assertTheme();
```

the key to retaining the value of `themeProvider.assertTheme()` is assigning it ti a `static` variable.
```dart
static ThemeData? _themeData;
```
`_themeData` retains its value through the creation and recreation of the `ThemeProvider` object in app's lifecycle.

