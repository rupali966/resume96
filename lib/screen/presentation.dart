import 'package:flutter/material.dart';
import 'package:untitled1/Widget/textwidgets.dart';
import 'package:untitled1/Widget/widgets.dart';
import 'package:untitled1/modal/dataofuser.dart';

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({Key? key}) : super(key: key);

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  @override
  Widget build(BuildContext context) {
    var usrdata = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Txt().smalltxt(
                  str: "Style 1",
                ),
                image(
                  img: "assets/p1.jpg",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'uiOne',
                      arguments: usrdata,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Txt().smalltxt(
                  str: "Style 2",
                ),
                image(
                  img: "assets/p2.png",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'uiTwo',
                      arguments: usrdata,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Txt().smalltxt(
                  str: "Style 3",
                ),
                image(
                  img: "assets/p3.png",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'uiThree',
                      arguments: usrdata,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Txt().smalltxt(
                  str: "Style 4",
                ),
                image(
                  img: "assets/Backgrounds.jpg",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'uiFour',
                      arguments: usrdata,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
