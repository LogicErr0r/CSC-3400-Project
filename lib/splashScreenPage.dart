import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'authPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

@override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 4), (){

      //Move from the splash screen to the auth page
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage()));
      }
    );
  }
  
  @override
  void dispose() {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/SplashScreenImage.png"),
            fit: BoxFit.contain,
            ),
            gradient: LinearGradient(
              colors: [Color.fromRGBO(237, 38, 71, 1.0), Color.fromRGBO(237, 38, 71, 1.0)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Add other widgets here
            ],
        ),
      ),
    );
  }
}