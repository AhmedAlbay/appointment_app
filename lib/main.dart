import 'package:appointment_app/core/di/dependency_injecton.dart';
import 'package:appointment_app/core/routing/app_router.dart';
import 'package:appointment_app/doc_app.dart';
import 'package:flutter/material.dart';

void main() {

  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}


