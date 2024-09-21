import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatefulWidget {
  const DocApp({super.key, required this.appRouter});
  final String appRouter;

  @override
  State<DocApp> createState() => _DocAppState();
}

class _DocAppState extends State<DocApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First Method',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
        ),
        home: const HomePage(title: 'First Method'),
      ),
    );
  }
}
