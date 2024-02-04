import 'package:flutter/material.dart';
import 'package:smarttelecom/modules/contacto/sections/map/gmapsHtml.dart';

class GoogleMapsIframe extends StatelessWidget {
  const GoogleMapsIframe({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: const GMapsHtml(
          url:
              "http://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.671805839604!2d-79.00670718948736!3d-2.910478297053694!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91cd186efc6a43c9%3A0x99fee27c469e4680!2sTelecomAustro!5e0!3m2!1ses-419!2sec!4v1693348080578!5m2!1ses-419!2sec",
        ),
      ),
    );
  }
}
