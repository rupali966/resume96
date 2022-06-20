import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:untitled1/Widget/textwidgets.dart';
import 'package:untitled1/Widget/widgets.dart';
import 'package:untitled1/modal/dataofuser.dart';

class UiOne extends StatefulWidget {
  const UiOne({Key? key}) : super(key: key);

  @override
  State<UiOne> createState() => _UiOneState();
}

class _UiOneState extends State<UiOne> {
  @override
  Widget build(BuildContext context) {
    User data = ModalRoute.of(context)!.settings.arguments as User;
    List userpersonal = [
      data.name,
      data.adress,
      data.email,
      data.phno,
      data.aboutyourself,
    ];
    List professional = [
      data.skill,
      data.skill2,
      data.school,
      data.cource,
      data.yearofpassing,
    ];
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/p1.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      // ignore: unnecessary_null_comparison
                      child: CircleAvatar(
                        backgroundImage: FileImage(
                          File(data.photo!.path),
                        ),
                      ),
                    ),
                  ),
                  Txt().smalltxt(
                    str: "Personal Details".toUpperCase(),
                    bgclr: Colors.white,
                    size: 18,
                  ),
                  Txt().smalltxt(
                    str: "Name : ${data.name}",
                  ),
                  Txt().smalltxt(
                    str: "Address : ${data.adress}",
                  ),
                  Txt().smalltxt(
                    str: "Email : ${data.email}",
                  ),
                  Txt().smalltxt(
                    str: "Ph No. : ${data.phno}",
                  ),
                  Txt().smalltxt(
                    str: "Professional Details".toUpperCase(),
                    bgclr: Colors.white,
                    size: 18,
                  ),
                  Txt().smalltxt(
                    str: "About : ${data.aboutyourself}",
                    ),
                  Txt().smalltxt(
                    str: "Skills : ${data.skill} , ${data.skill2}"
                  ),
                  Txt().smalltxt(
                    str: data.school,
                    bgclr: Colors.white,
                  ),
                  Txt().smalltxt(
                    str: data.cource,
                    bgclr: Colors.white,
                  ),
                  Txt().smalltxt(
                    str: "Year of Passing : ${data.yearofpassing}",
                    bgclr: Colors.white,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await pdfgenerate(
                          img2: data.photo!,
                          userpersonal,
                          professional,
                          color: PdfColors.blue200,
                          img: "assets/p1.jpg",
                        );
                      },
                      child: const Text(
                        "Generate",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
