import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class Section4Servicios extends StatelessWidget {
  const Section4Servicios({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, color: Colors.white, child: const _Panel());
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
      child: const _Info(),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveGridCol(
          lg: 6,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: _TextContentComplete(),
          ),
        ),
        ResponsiveGridCol(
          lg: 6,
          child: Image.asset("images/servicios/1.jpg"),
        ),
      ],
    );
  }
}

class _TextContentComplete extends StatelessWidget {
  const _TextContentComplete();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
            child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.tab_sharp),
          ],
        )),
        ResponsiveGridCol(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vollkorn(
                  "Libere el poder de IoT y LoRaWAN con nuestros servicios",
                  context.width < 779 ? 32 : 52,
                  Colors.black),
              manrope(
                  "Experimente una conectividad perfecta y conocimientos de datos avanzados con nuestros productos de IoT y LoRaWAN de vanguardia. Transforme sus operaciones comerciales y obtenga una ventaja competitiva en la era digital",
                  context.width < 779 ? 15 : 18,
                  Colors.black)
            ],
          ),
        ),
      ],
    );
  }
}
