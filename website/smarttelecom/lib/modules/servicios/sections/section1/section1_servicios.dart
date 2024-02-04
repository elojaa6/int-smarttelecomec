import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class Section1Servicios extends StatelessWidget {
  const Section1Servicios({super.key});

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
          child: Image.asset("images/servicios/1.jpg"),
        ),
        ResponsiveGridCol(
          lg: 6,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: _TextContentComplete(),
          ),
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
          child: const _TextSection(
            title: "Explora nuestros servicios",
            description:
                "Ofrecemos una amplia gama de servicios IoT y LoRaWAN para satisfacer sus necesidades. Desde la integración de dispositivos hasta el análisis de datos, lo tenemos cubierto.",
          ),
        ),
        ResponsiveGridCol(
          child: const _TextSection(
              title: "Integración de dispositivos",
              description:
                  "Nuestros equipos de expertos integrará perfectamente sus dispositivos IoT en su infraestructura existente, garantizando una comunicación y un flujo de datos fluidos."),
        ),
        ResponsiveGridCol(
          child: const _TextSection(
              title: "Ánalisis de datos",
              description:
                  "Libere el poder de sus datos de IoT con nuestras soluciones de análisis avanzado. Obtenga información valiosa y tome decisiones basadas en datos para impulsar el crecimiento empresarial."),
        ),
      ],
    );
  }
}

class _TextSection extends StatelessWidget {
  final String title;
  final String description;
  const _TextSection({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          vollkorn(title, context.width < 779 ? 25 : 40, Colors.black),
          manrope(description, context.width < 779 ? 13 : 18, Colors.black)
        ],
      ),
    );
  }
}
