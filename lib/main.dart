import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/utilis/app_routers.dart';
import 'core/utilis/styles.dart';

void main() {
  runApp(
      DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ) // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          fontFamily: 'Cairo',
          colorScheme: ColorScheme.fromSeed(seedColor: Styles.primaryColor)),

      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
    );
  }
}

