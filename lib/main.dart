import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_project/app.dart';
import 'package:mvvm_project/core/app_providers.dart';
import 'package:mvvm_project/core/injections/di.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.dev);
  runApp(MultiProvider(
    providers: AppProviders.allProviders,
    child: const PracticeProject(),
  ));
}
