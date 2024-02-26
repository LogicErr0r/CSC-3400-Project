import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mocsmunchv2/pages/loginPages/firebase_options.dart';
import 'package:mocsmunchv2/pages/loginPages/userAccountPage.dart';
import 'package:mocsmunchv2/pages/miscPages/splashScreenPage.dart';
import 'package:mocsmunchv2/pages/navPages/menusPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
