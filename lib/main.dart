import 'package:flutter/material.dart';
import 'package:nursense/userPages/dashboard.dart';
import 'package:nursense/userPages/level_select.dart';
import 'package:nursense/userPages/loading.dart';
import 'package:nursense/auth/login.dart';
import 'package:nursense/userPages/onboarding.dart';
import 'package:nursense/auth/signup.dart';
import 'package:nursense/auth/signup_confirm.dart';
import 'package:nursense/quiz/quiz_instruction.dart';
import 'package:nursense/userPages/subject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    fontFamily: "Urbanist", // Apply Urbanist to the whole app
  ),
      debugShowCheckedModeBanner: false,
     
      initialRoute: '/', // Define the initial route
      routes: {
        '/': (context) => const Loading(), // Default route
        '/onboarding': (context) => const Onboarding(),
        '/login': (context) => const Login(), 
        '/signup': (context) => const Signup(),
        '/confirmation': (context) => const SignupConfirm(),
        '/level_select': (context) => const LevelSelect(),
        '/dashboard' : (context) => const Dashboard(),
        '/subject' : (context) => const Subject(),
        '/quiz_instruction' : (context) => const QuizInstruction(),

      }, 
    );
  }
}

