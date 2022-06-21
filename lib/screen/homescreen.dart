// ignore_for_file: camel_case_types, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/Widget/statefullwidgets.dart';
import 'package:untitled1/Widget/textwidgets.dart';
import 'package:untitled1/Widget/widgets.dart';
import 'package:untitled1/modal/dataofuser.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

// ignore: camel_case_types, constant_identifier_names
enum score { Percentage, CGPA }

enum passing { pursuing, graduate }



class _MainHomeScreenState extends State<MainHomeScreen> {
  Input input = Input();
  final _formKey = GlobalKey<FormState>();
  score? _character = score.Percentage;
  passing? pass = passing.graduate;
  ImagePicker imgpker = ImagePicker();
  String s = "";
  File? _image;
  User usr = User();
  TextEditingController name = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController skill = TextEditingController();
  TextEditingController skill2 = TextEditingController();
  TextEditingController aboutyourself = TextEditingController();
  TextEditingController cource = TextEditingController();
  TextEditingController school = TextEditingController();
  TextEditingController persentage = TextEditingController();
  TextEditingController yearofpassing = TextEditingController();

// studyfied
   TextEditingController cntrstudyprogram0 = TextEditingController();
   TextEditingController cntrstudyprogram1 = TextEditingController();
   TextEditingController cntrstudyprogram2 = TextEditingController();
  TextEditingController cntrplaceofedu = TextEditingController();
  TextEditingController cntrcgpa = TextEditingController();
  TextEditingController cntrproject = TextEditingController();
  static TextEditingController? cntrskill1 = TextEditingController();
  static TextEditingController? cntrskill2 = TextEditingController();
  static TextEditingController? cntrskill3 = TextEditingController();
  List cntrskill = [cntrskill1, cntrskill2, cntrskill3];

  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  List Studyfi = [
    "",
  ];
  List Workfi = [
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/Backgrounds.jpg",
            ),
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: _openImagePicker,
                            child: SizedBox(
                              // color: Colors.white,
                              height: 200,
                              width: 200,
                              child: _image == null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.amber.shade300,
                                    )
                                  : CircleAvatar(
                                      backgroundImage: FileImage(
                                        _image!,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Txt().smalltxt(
                          str: "Personal Details",
                          size: 18,
                          bgclr: Colors.white,
                        ),
                        input.inputForm(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          enbldbrdrclr: Colors.white,
                          fcdbordrclr: Colors.blue,
                          hintxt: "Name",
                          txtcntr: name,
                          hintStyle: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        input.inputForm(
                          fcdbordrclr: Colors.blue,
                          enbldbrdrclr: Colors.white,
                          hintxt: "Address",
                          txtcntr: adress,
                          hintStyle: TextStyle(
                            fontSize: 10,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        input.inputForm(
                          fcdbordrclr: Colors.blue,
                          enbldbrdrclr: Colors.white,
                          hintxt: "Email Id",
                          txtcntr: email,
                          hintStyle: TextStyle(
                            fontSize: 10,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        input.inputForm(
                          fcdbordrclr: Colors.blue,
                          enbldbrdrclr: Colors.white,
                          hintxt: "Mobile Number",
                          txtcntr: phno,
                          hintStyle: TextStyle(
                            fontSize: 10,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        input.inputForm(
                          txtcntr: aboutyourself,
                          enbldbrdrclr: Colors.white,
                          fcdbordrclr: Colors.blue,
                          hintxt: "About Your Self",
                          hintStyle: TextStyle(
                            fontSize: 10,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Txt().smalltxt(
                          str: "Academic Details",
                          size: 18,
                          bgclr: Colors.white,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: Studyfi.length > 3 ? 3 : Studyfi.length,
                            itemBuilder: (context, i) {
                              return  Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Txt().smalltxt(
                                        size: 12,
                                        str: "Study Program ${i + 1}",
                                        bgclr: Colors.white),
                                    StudyField(i),
                                  ]);
                            }),
                        // StudyField(),
                        Row(
                          children: [
                            Txt().smalltxt(
                              onTap: () {
                                setState(() {
                                  Studyfi.add("value");
                                });
                              },
                              str: "Study Program +",
                              size: 12,
                              clr: Colors.amber.shade400,
                              bgclr: Colors.white,
                            ),
                            Txt().smalltxt(
                              onTap: () {
                                setState(() {
                                  Studyfi.length == 1
                                      ? 1
                                      : Studyfi.removeLast();
                                });
                              },
                              str: "Study Program -",
                              size: 12,
                              clr: Colors.amber.shade400,
                              bgclr: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Txt().smalltxt(
                          str: "Work Experience",
                          size: 18,
                          bgclr: Colors.white,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: Workfi.length > 3 ? 3 : Workfi.length,
                            itemBuilder: (context, i) {
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Txt().smalltxt(
                                        size: 12,
                                        str: "Reference ${i + 1}",
                                        bgclr: Colors.white),
                                    WorkField(i),
                                  ]);
                            }),
                        Row(
                          children: [
                            Txt().smalltxt(
                              onTap: () {
                                setState(() {
                                  Workfi.add("value");
                                });
                              },
                              str: "Experience+",
                              size: 12,
                              clr: Colors.amber.shade400,
                              bgclr: Colors.white,
                            ),
                            Txt().smalltxt(
                              onTap: () {
                                setState(() {
                                  Workfi.length == 1 ? 1 : Workfi.removeLast();
                                });
                              },
                              str: "Experience -",
                              size: 12,
                              clr: Colors.amber.shade400,
                              bgclr: Colors.white,
                            ),
                          ],
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                usr.setUser(
                                  name: name.text.toString(),
                                  adress: adress.text.toString(),
                                  email: email.text.toString(),
                                  aboutyourself: aboutyourself.text.toString(),
                                  phno: phno.text.toString(),
                                  cource: cource.text.toString(),
                                  school: school.text.toString(),
                                  persentage: persentage.text.toString(),
                                  skill2: skill2.text.toString(),
                                  skill: skill.text.toString(),
                                  photo: _image!,
                                  yearofpassing: yearofpassing.text.toString(),
                                );
                                Navigator.pushNamed(
                                  context,
                                  'present',
                                  arguments: usr,
                                );
                              }
                            },
                            child: const Text('Save'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
