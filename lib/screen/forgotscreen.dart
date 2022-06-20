import 'package:flutter/material.dart';
import 'package:untitled1/Widget/widgets.dart';
import 'package:untitled1/screen/signupscreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Usr;

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "../assets/Elegant-Blue.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  str: "User Name Is => ${args.uname}",
                ),
                text(
                  str: "Password Is => ${args.upass}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
