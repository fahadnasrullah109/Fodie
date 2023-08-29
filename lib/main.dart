import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fodei/presentation/dashboard/history/history_view_model.dart';
import 'package:fodei/presentation/dashboard/home/home_view_model.dart';
import 'package:fodei/presentation/welcome/welcome_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => HistoryViewModel()),
      ],
      child: const FodeiApp(),
    ),
  );
}

class FodeiApp extends StatelessWidget {
  const FodeiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'FodeiApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 50, 183, 104)),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(textTheme).copyWith(
          titleLarge: GoogleFonts.inter(
            textStyle: textTheme.bodyMedium?.copyWith(
                fontSize: 20, color: const Color.fromARGB(255, 31, 41, 55)),
          ),
          bodyLarge: GoogleFonts.inter(
            textStyle: textTheme.bodyMedium?.copyWith(
                fontSize: 17, color: const Color.fromARGB(255, 75, 85, 99)),
          ),
          bodyMedium: GoogleFonts.inter(
            textStyle: textTheme.bodyMedium?.copyWith(
                fontSize: 13, color: const Color.fromARGB(255, 75, 85, 99)),
          ),
          bodySmall: GoogleFonts.inter(
            textStyle: textTheme.bodyMedium?.copyWith(
                fontSize: 10, color: const Color.fromARGB(255, 75, 85, 99)),
          ),
        ),
      ),
      home: const WelcomeWidget(),
    );
  }
}
