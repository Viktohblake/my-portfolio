import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) {
        return MaterialApp(
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          home: const PortfolioPage(),
        );
      },

    );
  }
}
