import 'package:flutter/material.dart';
import 'package:flutteradvnced/core/di/dependency_injection.dart';
import 'package:flutteradvnced/core/routing/app_router.dart';
import 'package:flutteradvnced/doc_app.dart';

void main() {
  setupGetIt();
  runApp(
      DocApp(
    appRouter: AppRouter(),
  ));
}


