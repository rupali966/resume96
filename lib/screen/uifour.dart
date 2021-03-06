
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled1/Widget/statefullwidgets.dart';
import 'package:untitled1/Widget/textwidgets.dart';
import 'package:untitled1/Widget/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:untitled1/modal/dataofuser.dart';
import 'package:untitled1/modal/studyprogram.dart';
studyprogramlist study = studyprograms;
workprogramlist work = workprograms;
class UiFour extends StatefulWidget {
  const UiFour({Key? key}) : super(key: key);

  @override
  State<UiFour> createState() => _UiFourState();
}

class _UiFourState extends State<UiFour> {
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
                  'assets/Backgrounds.jpg',
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
                    str: "About : ${data.aboutyourself}",
                  ),
                  Txt().smalltxt(
                    str: "Educational Details".toUpperCase(),
                    bgclr: Colors.white,
                    size: 18,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: study.placeofeducation.length,
                      itemBuilder: (context, i) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt().smalltxt(
                                  str: "Study Program ${i + 1}".toUpperCase(),
                                  bgclr: Colors.white,
                                  size: 14),
                              Txt().smalltxt(
                                  str:
                                  "Degree/course : ${study.studyprograms[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                              Txt().smalltxt(
                                  str:
                                  "Place of Education : ${study.placeofeducation[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                              Txt().smalltxt(
                                  str:
                                  "CGPA : ${study.cgpa[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                              Txt().smalltxt(
                                  str:
                                  "Projects : ${study.project[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                            ],
                          ),
                        );
                      }),
                  Txt().smalltxt(
                    str: "Experience".toUpperCase(),
                    bgclr: Colors.white,
                    size: 18,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: work.title.length,
                      itemBuilder: (context, i) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt().smalltxt(
                                  str: "Experience ${i + 1}".toUpperCase(),
                                  bgclr: Colors.white,
                                  size: 14),
                              Txt().smalltxt(
                                  str:
                                  "Title : ${work.title[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                              Txt().smalltxt(
                                  str:
                                  "Company Description : ${work.companeydiscription[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                              Txt().smalltxt(
                                  str:
                                  "Work Place : ${work.workplace[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                              Txt().smalltxt(
                                  str:
                                  "Company Contact No. : ${work.companey_contact_number[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                              Txt().smalltxt(
                                  str:
                                  "Reference Name : ${work.refrence_person[i].toString().toUpperCase()}",
                                  bgclr: Colors.white,
                                  size: 12),
                            ],
                          ),
                        );
                      }),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await pdfgenerate(
                          data,
                          img2: data.photo!,
                          color: PdfColors.blue200,
                          img: "assets/Backgrounds.jpg",
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
