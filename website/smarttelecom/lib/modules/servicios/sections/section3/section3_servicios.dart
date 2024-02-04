import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class Section3Servicios extends StatelessWidget {
  const Section3Servicios({super.key});

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
          child: const _TextSection(
            title: "Funciones de servicio mejoradas",
            description:
                "Nuestra empresa ofrece una gama se servicios adicionales para mejorar su experiencia.",
          ),
        ),
        ResponsiveGridCol(
          child: const _TextSection(
              title: "Opciones de precios flexibles",
              description:
                  "Ofrecemos opciones de precios flexibles que se adaptan a su presupuesto y necesidades."),
        ),
        ResponsiveGridCol(
          child: const _TextSection(
              title: "Atención al cliente 24/7",
              description:
                  "Nuestro dedicado equipo de atención al cliente está disponible las 24 horas del día, los 7 días de la semana para ayudarlo con cualquier consulta o problema."),
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
          manrope(description, context.width < 779 ? 15 : 18, Colors.black)
        ],
      ),
    );
  }
}
