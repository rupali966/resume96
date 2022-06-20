import 'package:flutter/material.dart';

class Txt {
  Txt();

  Widget smalltxt({
    double? size,
    Color? clr,
    Color? bgclr,
    String? str,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgclr,
        ),
        child: Text(
          str!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: clr,
            fontSize: size,
          ),
        ),
      ),
    );
  }
}
