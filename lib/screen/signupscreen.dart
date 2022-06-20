import 'package:flutter/material.dart';
import 'package:untitled1/Widget/textwidgets.dart';
import 'package:untitled1/Widget/widgets.dart';
import 'package:untitled1/modal/logindata.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class Usr {
  Usr();
  String? uname;
  String? upass;
  void setting({
    String? usr,
    String? pass,
  }) {
    uname = usr;
    upass = pass;
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  Input ipt = Input();
  Usr userinfo = Usr();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("../assets/Backgrounds.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    str: "Sign-Up",
                    clr: const Color.fromRGBO(255, 247, 235, 1),
                  ),
                ],
              ),
              ipt.inputa(
                hintxt: "Username",
                txtcntr: username,
                fcdbordrclr: Colors.amber.shade900,
                preic: IconButton(
                  onPressed: () {
                    String usr = username.text.toString();
                    Logindata().setData(
                      user: usr,
                    );
                    setState(() {
                      username.text = "$usr@Edu.com".replaceAll(" ", "");
                    });
                    print("username");
                  },
                  icon: const Icon(
                    Icons.alternate_email_rounded,
                    color: Colors.amber,
                  ),
                ),
              ),
              ipt.inputa(
                txtcntr: password,
                obscuretxt: ipt.obsucur,
                hintxt: "Password",
                preic: IconButton(
                  onPressed: () {
                    print("password");
                    setState(() {
                      (ipt.obsucur == true)
                          ? ipt.obsucur = false
                          : ipt.obsucur = true;
                    });
                  },
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.amber,
                  ),
                ),
                fcdbordrclr: Colors.amber.shade900,
                sufixtxt: "Forgot ?",
                sufxic: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "forgot",
                    );
                  },
                  tooltip: "Forgot Password",
                  icon: const Icon(
                    Icons.help_outline_rounded,
                    color: Colors.amber,
                  ),
                ),
              ),
              button(
                  btntxt: "SignUp",
                  onTap: () {
                    userinfo.setting(
                      pass: password.text.toString(),
                      usr: username.text.toString(),
                    );

                    Navigator.pushNamed(context, "login", arguments: userinfo);
                    print("${Logindata().usr} ${Logindata().pass}");
                  }),
              const SizedBox(
                height: 10,
              ),
              Txt().smalltxt(
                  bgclr: const Color.fromRGBO(255, 247, 235, 1),
                  clr: Colors.amber.shade900,
                  str: "or Login",
                  onTap: () {
                    print("Login");
                    Navigator.popAndPushNamed(context, 'login');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
