import 'package:appointment_app/core/routing/app_router.dart';
import 'package:appointment_app/core/routing/routes.dart';
import 'package:appointment_app/core/theming/color.dart'; // Ensure this path is correct
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),  // Ensure the designSize is correct for your app
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        title: 'First Method',
        onGenerateRoute:AppRouter.generateRoute,
        theme: ThemeData(
          primaryColor: ColorManager.mainColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        // Add `const` if `OnBoardingScreen` is stateless
      ),
    );
  }
}
