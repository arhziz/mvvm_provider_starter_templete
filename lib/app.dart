import 'package:flutter/material.dart';
import 'package:mvvm_project/core/presentation/styles/theme_data.dart';
import 'package:mvvm_project/features/home/presentation/views/home_view.dart';

class PracticeProject extends StatelessWidget {
  const PracticeProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Startup Template',
      theme: PracticeThemeData.getThemedata(),
      home: const HomePage(),
    );
  }
}
