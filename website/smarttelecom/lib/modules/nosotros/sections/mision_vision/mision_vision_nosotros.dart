import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class MisionVisionNosotros extends StatelessWidget {
  const MisionVisionNosotros({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        color: const Color.fromRGBO(241, 248, 254, 1),
        child: const _Panel());
  }
}

class _Panel extends StatelessWidget {
  const _Panel();

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 850 ? true : false;
    double width = context.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          isMobile ? 15 : width / 10, 50, isMobile ? 15 : width / 10, 50),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            lg: 6,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: _Text(
                title: "Nuestra misión",
                description:
                    "Nuestra misión es empoderar a individuos, hogares y comunidades para que tomen el control de su entorno a través de la tecnología del Internet de las Cosas.",
              ),
            ),
          ),
          ResponsiveGridCol(
            lg: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "images/products/4.jpeg",
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ResponsiveGridCol(
            lg: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "images/products/4.jpeg",
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ResponsiveGridCol(
            lg: 6,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: _Text(
                title: "Nuestra visión",
                description:
                    "Visualizamos un mundo interconectado en el que cada dispositivo, cada hogar y cada ciudad estén unidos a través del Internet de las Cosas.",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final String title;
  final String description;
  const _Text({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vollkorn(
          title,
          40,
          const Color.fromRGBO(107, 117, 126, 1),
        ),
        encodeSans(description, context.width < 779 ? 15 : 18, Colors.black)
      ],
    );
  }
}
