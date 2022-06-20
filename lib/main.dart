import 'package:flutter/material.dart';
import 'package:untitled1/screen.dart';
import 'package:untitled1/screen/forgotscreen.dart';
import 'package:untitled1/screen/homescreen.dart';
import 'package:untitled1/screen/loginscreen.dart';
import 'package:untitled1/screen/presentation.dart';
import 'package:untitled1/screen/signupscreen.dart';
import 'package:untitled1/screen/uifour.dart';
import 'package:untitled1/screen/uione.dart';
import 'package:untitled1/screen/uithree.dart';
import 'package:untitled1/screen/uitwo.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        'forgot': (context) => const ForgotPasswordScreen(),
        'hometwo':(context) => const MainHomeScreen(),
        'signup':(context) => const SignUpScreen(),
        'login':(context) => const LoginScreen(),
        'present':(context) => const PresentationScreen(),
        'uiOne':(context) => const UiOne(),
        'uiTwo':(context) => const Uitwo(),
        'uiThree':(context) => const Uithree(),
        'uiFour':(context) => const UiFour(),
       
      },
    ),
  );
}
