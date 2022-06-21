import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:untitled1/Widget/statefullwidgets.dart';
import 'package:untitled1/modal/dataofuser.dart';
import 'package:untitled1/modal/studyprogram.dart';

Widget button({
  double tppad = 5,
  double btmpad = 5,
  double lftpad = 25,
  double rgtpad = 25,
  double height = 55,
  dynamic Function()? onTap,
  String btntxt = "",
}) {
  return Padding(
    padding: EdgeInsets.only(
      top: tppad,
      bottom: btmpad,
      right: rgtpad,
      left: lftpad,
    ),
    child: InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.amber.shade900)),
        child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(234, 199, 142, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            btntxt,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget text({
  String str = "",
  Color clr = Colors.white,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 20,
          bottom: 20,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Expanded(
          child: Text(
            str,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}

class Input {
  bool obsucur = false;

  Widget inputa({
    String hintxt = "",
    double lftpad = 15,
    double rgtpad = 15,
    double tppad = 10,
    double btmpad = 20,
    TextEditingController? txtcntr,
    bool? obscuretxt,
    Color txtclr = Colors.black,
    Color fcdbordrclr = Colors.amber,
    Color enbldbrdrclr = Colors.amber,
    Color deblbrdrclr = Colors.amber,
    Widget? preic,
    Widget? sufxic,
    String sufixtxt = "",
    Function()? fun,
    final TextStyle? hintStyle,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: lftpad,
        top: tppad,
        right: rgtpad,
        bottom: btmpad,
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: TextField(
          controller: txtcntr,
          obscureText: obscuretxt ??= false,
          onTap: fun,
          style: TextStyle(
            color: txtclr,
            fontSize: 12,
          ),
          decoration: InputDecoration(
            hintText: hintxt,
            hintStyle: hintStyle,
            prefixIcon: preic,
            suffixIcon: sufxic,
            suffixText: sufixtxt,
            border: inptbordr(
              clr: fcdbordrclr,
            ),
            focusedBorder: inptbordr(
              clr: fcdbordrclr,
            ),
            enabledBorder: inptbordr(
              clr: enbldbrdrclr,
            ),
            disabledBorder: inptbordr(
              clr: deblbrdrclr,
            ),
          ),
        ),
      ),
    );
  }

  Widget inputForm({
    String hintxt = "",
    double lftpad = 30,
    double rgtpad = 30,
    double tppad = 10,
    double btmpad = 20,
    TextEditingController? txtcntr,
    bool? obscuretxt,
    Color txtclr = Colors.black,
    Color fcdbordrclr = Colors.amber,
    Color enbldbrdrclr = Colors.amber,
    Color deblbrdrclr = Colors.amber,
    Widget? preic,
    Widget? sufxic,
    String sufixtxt = "",
    Function()? fun,
    FormFieldValidator<String>? validator,
    final TextStyle? hintStyle,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: lftpad,
        top: tppad,
        right: rgtpad,
        bottom: btmpad,
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: TextFormField(
          validator: validator,
          controller: txtcntr,
          obscureText: obscuretxt ??= false,
          onTap: fun,
          style: TextStyle(
            color: txtclr,
            fontSize: 12,
          ),
          decoration: InputDecoration(
            hintText: hintxt,
            hintStyle: hintStyle,
            prefixIcon: preic,
            suffixIcon: sufxic,
            suffixText: sufixtxt,
            border: inptbordr(
              clr: fcdbordrclr,
            ),
            focusedBorder: inptbordr(
              clr: fcdbordrclr,
            ),
            enabledBorder: inptbordr(
              clr: enbldbrdrclr,
            ),
            disabledBorder: inptbordr(
              clr: deblbrdrclr,
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder inptbordr({
  Color clr = Colors.amber,
}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: clr,
    ),
  );
}

Widget image({
  String? img,
  GestureTapCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(
            image: AssetImage(
              img!,
            ),
            fit: BoxFit.fill,
          )),
    ),
  );
}

dynamic pdfgenerate(
  User data, {
  PdfColor? color,
  String img = "",
  File? img2,
}) async {
  studyprogramlist study = studyprograms;
  workprogramlist work = workprograms;
  List dataof = [
    data.name,
    data.adress,
    data.email,
    data.phno,
    data.aboutyourself,
  ];
  List dataString = [
    "Name : ",
    "Address : ",
    "Email : ",
    "Phone Number : ",
    "About : ",
  ];
  // final netImage = await networkImage('https://www.nfet.net/nfet.jpg');

  // final profileImage1 = pw.MemoryImage(
  //   (await rootBundle.load(img2)).buffer.asUint8List(),
  // );
  final image2 = pw.MemoryImage(
    File(img2!.path).readAsBytesSync(),
  );
  final image = await imageFromAssetBundle(img);
  // final image2 = await imageFromAssetBundle(img2!.path);

  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Expanded(
          child: pw.Container(
            alignment: pw.Alignment.topLeft,
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: image,
              ),
            ),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  padding: const pw.EdgeInsets.all(20),
                  margin: const pw.EdgeInsets.all(20),
                  alignment: pw.Alignment.center,
                  color: PdfColors.white,
                  child: pw.Text(
                    "Personal Details",
                    style: const pw.TextStyle(
                      background: pw.BoxDecoration(
                        color: PdfColors.white,
                      ),
                      fontSize: 28,
                    ),
                  ),
                ),
                pw.Center(
                  child: pw.ClipOval(
                    child: pw.Container(
                      height: 150,
                      width: 150,
                      decoration: pw.BoxDecoration(
                        image: pw.DecorationImage(
                          image: image2,
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(height: 90),
                pw.Padding(
                  padding: pw.EdgeInsets.all(20),
                  child: pw.ListView.builder(
                      itemCount: dataof.length,
                      itemBuilder: (context, i) {
                        return pw.Align(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.SizedBox(height: 15),
                                  pw.Text(
                                    dataString[i].toString() +
                                        dataof[i].toString(),
                                    style: const pw.TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ]));
                      }),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Expanded(
          child: pw.Container(
            padding: pw.EdgeInsets.all(20),
            alignment: pw.Alignment.topLeft,
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: image,
              ),
            ),
            child: pw.Padding(
              padding: pw.EdgeInsets.all(20),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(
                    height: 70,
                  ),
                  pw.Text(
                    "Educational Details".toUpperCase(),
                    style: const pw.TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  pw.ListView.builder(
                      itemCount: study.placeofeducation.length,
                      itemBuilder: (context, i) {
                        return pw.Align(
                          alignment: pw.Alignment.topLeft,
                          child: pw.Padding(
                            padding: pw.EdgeInsets.all(20),
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Text(
                                  "Study Program ${i + 1}".toUpperCase(),
                                  style: const pw.TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 13,
                                ),
                                pw.Text(
                                  "Degree/course : ${study.studyprograms[i].toString().toUpperCase()}",
                                  style: const pw.TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Text(
                                  "Place of Education : ${study.placeofeducation[i].toString().toUpperCase()}",
                                  style: const pw.TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Text(
                                  "CGPA : ${study.cgpa[i].toString().toUpperCase()}",
                                  style: const pw.TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Text(
                                  "Projects : ${study.project[i].toString().toUpperCase()}",
                                  style: const pw.TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Expanded(
          child: pw.Container(
            padding: pw.EdgeInsets.all(20),
            alignment: pw.Alignment.topLeft,
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: image,
              ),
            ),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(
                  height: 70,
                ),
                pw.Text(
                  "Educational Details".toUpperCase(),
                  style: const pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
                pw.ListView.builder(
                    itemCount: study.placeofeducation.length,
                    itemBuilder: (context, i) {
                      return pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Padding(
                          padding: pw.EdgeInsets.all(20),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(
                                height: 10,
                              ),
                              pw.Text(
                                "Experience ${i + 1}".toUpperCase(),
                                style: const pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              pw.SizedBox(
                                height: 13,
                              ),
                              pw.Text(
                                "Title : ${work.title[i].toString().toUpperCase()}",
                                style: const pw.TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              pw.SizedBox(
                                height: 10,
                              ),
                              pw.Text(
                                "Work Place : ${work.workplace[i].toString().toUpperCase()}",
                                style: const pw.TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              pw.SizedBox(
                                height: 10,
                              ),
                              pw.Text(
                                "Company Description : ${work.companeydiscription[i].toString().toUpperCase()}",
                                style: const pw.TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              pw.SizedBox(
                                height: 10,
                              ),
                              pw.Text(
                                "Company Contact Number : ${work.companey_contact_number[i].toString().toUpperCase()}",
                                style: const pw.TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              pw.SizedBox(
                                height: 10,
                              ),
                              pw.Text(
                                "Reference Person : ${work.refrence_person[i].toString().toUpperCase()}",
                                style: const pw.TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              pw.SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      },
    ),
  );

  final directory =
      (await getExternalStorageDirectories(type: StorageDirectory.documents));

  File file = File("${directory!.first.path}/test.pdf");
  print(directory.first.path);
  await file.writeAsBytes(await pdf.save());
}
