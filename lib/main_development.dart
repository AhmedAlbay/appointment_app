import 'package:appointment_app/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:appointment_app/core/di/dependency_injecton.dart';
import 'package:appointment_app/core/helpers/shared_pref_helper.dart';
import 'package:appointment_app/core/routing/app_router.dart';
import 'package:appointment_app/doc_app.dart';

void main() async {
  // Ensure Flutter bindings are initialized before anything else
  WidgetsFlutterBinding.ensureInitialized();

  // Set up dependency injection
  setupGetIt();

  // Check if the user is logged in (asynchronously)
  await checkIfLoggedUser();

  // Run the Flutter app
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfLoggedUser() async {
  String userToken = await SharedPrefHelper.getSecuredString(SharedPreKey.userToken);
  isLoggedUser = userToken.isNotEmpty;
}
