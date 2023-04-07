import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  String text;
  double? size;
  Color? color;
  FontWeight? fontWeight;
  AppText(this.text, {super.key, this.color, this.fontWeight, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.arimo(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
