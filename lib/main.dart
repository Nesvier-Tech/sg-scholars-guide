// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/logger.dart';

import 'features/quiz_upload/presentation/pages/upload_questions_page.dart';
import 'features/quiz_mode/presentation/pages/ready_quiz_page.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';
import 'service_locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initializeServices();
  services<Logger>().i('Services initialized.');

  runApp(const ScholarsGuideApp());

  FlutterNativeSplash.remove();
}

class ScholarsGuideApp extends StatelessWidget {
  const ScholarsGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scholar\'s Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholar\'s Guide'),
      ),
      body: Center(
        // child: Text('Welcome to Scholar\'s Guide'),
        // child: QuizPage(subject: SUBJ.LANGUAGE),
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (UploadQuestionPage())),
                  );
          }, 
          child: Text("TEST")),
      ),
    );
  }
}
