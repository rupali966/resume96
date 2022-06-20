import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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
  List<dynamic> userpersonal,
  List<dynamic> professional, {
  PdfColor? color,
  String img = "",
  File? img2,
}) async {
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
                  padding: pw.EdgeInsets.all(20),
                  margin: pw.EdgeInsets.all(20),
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
                for (int i = 0; i < userpersonal.length; i++,)
                  pw.Container(
                    margin: pw.EdgeInsets.all(10),
                    padding: pw.EdgeInsets.all(10),
                    color: PdfColors.white,
                    child: pw.Text(
                      userpersonal[i],
                      style: const pw.TextStyle(
                        background: pw.BoxDecoration(
                          color: PdfColors.white,
                        ),
                        fontSize: 20,
                      ),
                    ),
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
                  margin: pw.EdgeInsets.all(20),
                  alignment: pw.Alignment.center,
                  padding: pw.EdgeInsets.all(20),
                  color: PdfColors.white,
                  child: pw.Text(
                    "Professional details",
                    style: const pw.TextStyle(
                      background: pw.BoxDecoration(
                        color: PdfColors.white,
                      ),
                      fontSize: 28,
                    ),
                  ),
                ),
                for (int i = 0; i < professional.length; i++)
                  pw.Container(
                    padding: pw.EdgeInsets.all(10),
                    margin: pw.EdgeInsets.all(10),
                    color: PdfColors.white,
                    child: pw.Text(
                      professional[i],
                      style: const pw.TextStyle(
                        background: pw.BoxDecoration(
                          color: PdfColors.white,
                        ),
                        fontSize: 20,
                      ),
                    ),
                  ),
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
