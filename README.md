# theming

This is an *opinionated* and effective way to provide multi-theme choice for your app.

<img src="https://user-images.githubusercontent.com/45709308/187513887-f14ad4ab-c99d-413f-a7dc-0e05d5782110.gif" width="40%" height="40%" />

theming depends on `provider` and `shared_preference` for state management and data retention respectively.

theming solves the issue of **loading a default theme** on the app startup before fetching last theme state from shared pref. After seeing this issue in two public articles, i decided to give it a try :shipit:

## key code

in `main()` and before `runApp()` is loaded, a single instance of `SharedPreferences` (none is created again thoughout the app) is created and passed into `ThemeProvider`. This is bacause it is imperative to acquire the last/previous theme state before loading the app. yes, `themeProvider.assertTheme()`.

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

if you find this repo useful, make sure to star 🌟 it. thank you.
