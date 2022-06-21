import 'package:flutter/material.dart';
import 'package:untitled1/Widget/textwidgets.dart';
import 'package:untitled1/Widget/widgets.dart';
import 'package:untitled1/modal/dataofuser.dart';
import 'package:untitled1/modal/studyprogram.dart';

date da = date();
studyprogramlist studyprograms = studyprogramlist();
workprogramlist workprograms = workprogramlist();

class StudyField extends StatefulWidget {
  StudyField(this.num, {Key? key}) : super(key: key);
  int num;

  // StudyField(this.cntrstudyprogram, this.cntrplaceofedu, this.cntrcgpa,
  //     this.cntrproject, this.cntrskill);

  @override
  State<StudyField> createState() => StudyFieldState();
}

class StudyFieldState extends State<StudyField> {
  DateTime? from;
  DateTime? to;

  void _frompicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        from = pickedDate;
      });
      da.setToday(from.toString());
      print("${da.getToday()}");
    });
  }

  void _topicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        to = pickedDate;
      });
    });
  }

  Input ipt = Input();
  List skills = [
    "",
  ];
  TextEditingController cntrstudyprogram = TextEditingController();
  TextEditingController cntrplaceofedu = TextEditingController();
  TextEditingController cntrcgpa = TextEditingController();
  TextEditingController cntrproject = TextEditingController();

  // StudyFieldState studyFieldState = StudyFieldState();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ipt.inputa(
            txtcntr: cntrstudyprogram,
            hintxt: "Study Program",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          ipt.inputa(
            txtcntr: cntrplaceofedu,
            hintxt: "institution/Place of Education",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          ipt.inputa(
            txtcntr: cntrcgpa,
            hintxt: "CGPA",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          dateAndTime(),
          ipt.inputa(
            txtcntr: cntrproject,
            hintxt: "Thesis/ Project",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    dismissDirection: DismissDirection.vertical,
                    backgroundColor: Colors.amber.shade900,
                    content: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text("Saving ${cntrstudyprogram.text.toString()}"),
                          Text("Saving ${cntrplaceofedu.text.toString()}"),
                          Text("Saving ${cntrcgpa.text.toString()}"),
                          Text("Saving ${cntrproject.text.toString()}"),
                        ],
                      ),
                    )));
                studyprogram stdypr = studyprogram(
                  cntrstudyprogram.text.toString(),
                  cntrplaceofedu.text.toString(),
                  cntrcgpa.text.toString(),
                  cntrproject.text.toString(),
                );

                studyprograms.setstudyprogram(widget.num, stdypr);
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber.shade300,
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget dateAndTime() {
    return Column(children: [
      Row(
        children: [
          Txt().smalltxt(str: "Form : ", bgclr: Colors.white, size: 10),
          Container(
              child: Txt().smalltxt(
                  str: from != null
                      ? from!.month.toString() + "/" + from!.year.toString()
                      : "..../....",
                  bgclr: Colors.white,
                  onTap: _frompicker)),
        ],
      ),
      Row(
        children: [
          Txt().smalltxt(str: "To : ", size: 10, bgclr: Colors.white),
          Container(
              child: Txt().smalltxt(
                  str: to != null
                      ? to!.month.toString() + "/" + to!.year.toString()
                      : "..../....",
                  bgclr: Colors.white,
                  onTap: () {
                    _topicker();
                  })),
        ],
      ),
    ]);
  }
}

class WorkField extends StatefulWidget {
  WorkField(this.num, {Key? key}) : super(key: key);
  int num;

  @override
  State<WorkField> createState() => _WorkFieldState();
}

class _WorkFieldState extends State<WorkField> {
  DateTime? from;
  DateTime? to;
  TextEditingController cntrtitle = TextEditingController();
  TextEditingController cntrwrk = TextEditingController();
  TextEditingController cntrcmpnydisci = TextEditingController();
  TextEditingController cntrref = TextEditingController();
  TextEditingController cntrcompcontcnu = TextEditingController();

  void _frompicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        from = pickedDate;
      });
      da.setToday(from.toString());
      print("${da.getToday()}");
    });
  }

  void _topicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        to = pickedDate;
      });
    });
  }

  Input ipt = Input();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ipt.inputa(
            txtcntr: cntrtitle,
            hintxt: "Title/Position",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          ipt.inputa(
            txtcntr: cntrwrk,
            hintxt: "Workplace/Company Name",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          ipt.inputa(
            txtcntr: cntrcmpnydisci,
            hintxt: "Company Description",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          dateAndTime(),
          ipt.inputa(
            txtcntr: cntrref,
            hintxt: "Reference of",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          ipt.inputa(
            txtcntr: cntrcompcontcnu,
            hintxt: "Company Contact No.",
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            enbldbrdrclr: Colors.white,
            fcdbordrclr: Colors.blue,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    dismissDirection: DismissDirection.vertical,
                    backgroundColor: Colors.amber.shade900,
                    content: Container(
                      height: 100,
                      child: Text("Saving ${cntrwrk.text.toString()}"),
                    )));
                workprogram workpr = workprogram(
                  cntrtitle.text.toString(),
                  cntrwrk.text.toString(),
                  cntrcmpnydisci.text.toString(),
                  cntrref.text.toString(),
                  cntrcompcontcnu.text.toString(),
                );

                workprograms.setworkprogram(widget.num, workpr);
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber.shade300,
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget dateAndTime() {
    return Column(children: [
      Row(
        children: [
          Txt().smalltxt(str: "Form : ", bgclr: Colors.white, size: 10),
          Container(
              child: Txt().smalltxt(
                  str: from != null
                      ? from!.month.toString() + "/" + from!.year.toString()
                      : "..../....",
                  bgclr: Colors.white,
                  onTap: _frompicker)),
        ],
      ),
      Row(
        children: [
          Txt().smalltxt(str: "To : ", size: 10, bgclr: Colors.white),
          Container(
              child: Txt().smalltxt(
                  str: to != null
                      ? to!.month.toString() + "/" + to!.year.toString()
                      : "..../....",
                  bgclr: Colors.white,
                  onTap: () {
                    _topicker();
                  })),
        ],
      ),
    ]);
  }
}
