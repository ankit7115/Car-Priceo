import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:show_car/Screens/first_screen.dart';
// import 'package:show_car/car/first_upScreen.dart';
import 'package:show_car/splash_screen/splash1.dart';
import 'package:show_car/splash_screen/starter1.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData.dark(),
    routes: {
      '/home': (context) => const HomeScreen(),
    },
    home: AnimatedSplashScreen(
      backgroundColor: const Color.fromRGBO(101, 140, 187, 1),
      splashTransition: SplashTransition.scaleTransition,
      duration: 2000,
      splash: Splash1(),
      nextScreen: SafeArea(child: Starter1()),
    ),
  );
  }
}