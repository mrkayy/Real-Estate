import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takehome/core/theme/light_theme.dart';
import 'package:takehome/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390.0, 844.0),
      splitScreenMode: false,
      minTextAdapt: true,
      builder: (_, __) => MaterialApp(
        title: 'Real Estate',
        theme: LightTheme.light,
        home: const DashboardPage(),
      ),
    );
  }
}
