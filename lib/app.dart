import 'package:attendance_app_with_sync/screens/add_subject.dart';
import 'package:attendance_app_with_sync/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:attendance_app_with_sync/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          title: 'Attendance Tracker',
          theme: ThemeData.from(
            colorScheme:
                lightColorScheme ??
                ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          ),
          darkTheme: ThemeData.from(
            colorScheme:
                darkColorScheme ??
                ColorScheme.fromSeed(
                  seedColor: Colors.lightBlue,
                  brightness: Brightness.dark,
                ),
          ),
          themeMode: ThemeMode.system,
          initialRoute: '/',
          routes: {
            '/': (context) => MyHomePage(title: "Home"),
            '/newSubject': (context) => AddSubject(),
            '/settings': (context) => Settings(),
          },
        );
      },
    );
  }
}
