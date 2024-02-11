import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'firebase_options.dart';
import 'router/app_router.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase.
  await Firebase.initializeApp(
    name: 'SG - Scholar\'s Guide',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ScholarsGuideApp());

  // TODO: [P1] Investigate unusual crashing of the app after going home and
  // then going back to the app (this happened after using the preserve
  // and remove feature of the FlutterNativeSplash package).
  // Update: The issue is independent from the FlutterNativeSplash package.
  // It seems like it is coming from the firebase package/s.
  FlutterNativeSplash.remove();
}

class ScholarsGuideApp extends StatelessWidget {
  const ScholarsGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Scholar\'s Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
