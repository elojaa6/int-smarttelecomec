import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//*Nuevos

Widget encodeSans(String label, double size, Color color) => Text(
      label,
      style: GoogleFonts.encodeSans(
        textStyle: TextStyle(fontSize: size, color: color),
      ),
    );

Widget openSans(String label, double size, Color color) => Text(
      label,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(fontSize: size, color: color),
      ),
    );

Widget vollkorn(String label, double size, Color color) => Text(
      label,
      style: GoogleFonts.vollkorn(
        textStyle: TextStyle(fontSize: size, color: color),
      ),
    );

Widget manrope(String label, double size, Color color) => Text(
      label,
      style: GoogleFonts.manrope(
        textStyle: TextStyle(fontSize: size, color: color),
      ),
    );

Widget montserrat(String label, double size, Color color) => Text(
      label,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(fontSize: size, color: color),
      ),
    );

Widget poppins(String label, double size, Color color) => Text(
      label,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(fontSize: size, color: color, fontWeight: FontWeight.w700),
      ),
    );

Widget raleway(String label, double size, Color color) => Text(
      label,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(fontSize: size, color: color),
      ),
    );

//*    

Widget largeBoldTextBlack(String label) => Text(label,
    style: TextStyle(fontSize: 25, color: Colors.grey[700], letterSpacing: 1));

Widget normalGreyText(String label) => Text(label,
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 10,
        wordSpacing: 1,
        letterSpacing: .5,
        color: Colors.grey[500]));

Widget boldBlackText(String label) => Text(label,
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 20,
        color: Colors.grey[800],
        fontWeight: FontWeight.w500,
        letterSpacing: 1));

Widget smallBlackText(String label) => Text(label,
    style: TextStyle(
        fontSize: 10,
        color: Colors.grey[800],
        fontWeight: FontWeight.w500,
        letterSpacing: 1));

//*
Widget titleGreyText(String label) => Text(label,
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,
    style: GoogleFonts.manrope(
        textStyle: const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontFamily: "Manrope",
      fontSize: 16,
    )));

Widget footerBlackText(String label) => Text(label,
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,
    style: const TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.w500,
        letterSpacing: 1));

Widget footerGreyText(String label) => Text(label,
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,
    style: const TextStyle(
        fontSize: 10,
        wordSpacing: 1,
        letterSpacing: .5,
        color: Color.fromARGB(255, 255, 255, 255)));
