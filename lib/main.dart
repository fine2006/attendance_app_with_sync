import 'package:flutter/material.dart';
import 'package:attendance_app_with_sync/app.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app_with_sync/database/database.dart';

void main() {
  runApp(
    Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      child: const MyApp(),
    ),
  );
}
