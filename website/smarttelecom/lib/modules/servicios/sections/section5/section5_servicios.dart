import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class Section5Servicios extends StatelessWidget {
  const Section5Servicios({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: const Color.fromRGBO(222, 225, 230, 1),
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
      child: const _Info(),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveGridCol(
          lg: 6,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: _Content(
              title: "Gestión de dispositivos de Internet de las Cosas (IoT)",
              description:
                  "La gestión de dispositivos IoT es el proceso que ayuda a las empresas e ISP a gestionar de forma remota la infraestructura,  puntos finales de su red y obtener datos para la toma de decisiones.",
              image: "images/servicios/1.jpg",
            ),
          ),
        ),
        ResponsiveGridCol(
          lg: 6,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: _Content(
              title: "Características de la Plataforma IoT",
              description:
                  "La gestión de dispositivos IoT hace referencia al proceso de gestión de identidad, control de acceso, garantía de calidad del servicio, gestión y mantenimiento de la seguridad de los datos de los dispositivos IoT.",
              image: "images/servicios/1.jpg",
            ),
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const _Content(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: raleway(title, context.width < 779 ? 25 : 32, Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: openSans(
              description, context.width < 779 ? 15 : 18, Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image),
        )
      ],
    );
  }
}
