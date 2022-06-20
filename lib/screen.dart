import 'package:flutter/material.dart';
import 'package:untitled1/screen/signupscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("../assets/Backgrounds.jpg")
              )
          ),
          child: const SignUpScreen(),
        ),
      ),
    );
  }
}
