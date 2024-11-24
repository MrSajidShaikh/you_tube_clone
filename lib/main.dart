import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoy_tube_clone/provider/theme_provider.dart';
import 'package:yoy_tube_clone/provider/video_provider.dart';
import 'View/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => VideoProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDark
          ? themeProvider.darkTheme
          : themeProvider.lightTheme,
      home: const SplashScreen(),
    );
  }
}
