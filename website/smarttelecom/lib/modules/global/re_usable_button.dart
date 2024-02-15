// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:url_launcher/url_launcher.dart';

//*Funcion para abrir enlace externo
Future<void> externo(Uri url) async {
  try {
    launchUrl(url);
  } catch (e) {
    throw Exception(e);
  }
}

Widget iconLabelButtons(String lebel, String path) => TextButton.icon(
      onPressed: () => print('pressed'),
      icon: SvgPicture.asset(
        path,
        width: 20,
        // ignore: deprecated_member_use
        color: Colors.white,
      ),
      label: Text(lebel, style: const TextStyle(color: Colors.white)),
    );

Widget textButtons(String label, Color color, Function()? onPressed) =>
    TextButton(onPressed: onPressed, child: encodeSans(label, 13, color));

Widget logoButton(String path) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 3),
    child: IconButton(
        // ignore: deprecated_member_use
        icon: SvgPicture.asset(path, width: 15, color: Colors.green),
        onPressed: () {}));

Widget normalButton(String label, Color txtcolor, String path, Color iconColor,
        Color backColor) =>
    InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              color: backColor, borderRadius: BorderRadius.circular(5)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            if (path != '') Image.asset(path, color: iconColor, width: 15),
            if (path != '') const SizedBox(width: 5),
            Text(label,
                style: TextStyle(
                    fontSize: 10, color: txtcolor, fontWeight: FontWeight.w700))
          ])),
    );

Widget colorLogoButton(String path) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 3),
    child:
        IconButton(icon: SvgPicture.asset(path, width: 20), onPressed: () {}));
