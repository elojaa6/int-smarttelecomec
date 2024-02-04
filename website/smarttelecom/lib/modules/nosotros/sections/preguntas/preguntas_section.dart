import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class PreguntasNosotros extends StatelessWidget {
  const PreguntasNosotros({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.white,
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
          ResponsiveGridCol(lg: 3, child: const _PrincipalText()),
          ResponsiveGridCol(lg: 9, child: const _PreguntasText())
        ],
      ),
    );
  }
}

class _PrincipalText extends StatelessWidget {
  const _PrincipalText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vollkorn(
          "Juntos, .....................",
          40,
          Colors.black,
        ),
        encodeSans(
            "En SmartTelecom, estamos dedicados a llevar la innovación del Internet de las Cosas (IoT) a cada aspecto de tu vida.",
            context.width < 779 ? 15 : 18,
            Colors.black)
      ],
    );
  }
}

class _PreguntasText extends StatelessWidget {
  const _PreguntasText();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(children: [
      ResponsiveGridCol(
        lg: 6,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: _TextPreguntas(
            title: "Quiénes somos",
            description:
                "Somos líderes en la venta de equipos avanzados de domótica, seguridad y soluciones IoT diseñadas para crear hogares inteligentes, ciudades conectadas y comunidades más eficientes.",
          ),
        ),
      ),
      ResponsiveGridCol(
        lg: 6,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: _TextPreguntas(
            title: "Cómo ayudamos",
            description:
                "A través de la innovación constante, la calidad excepcional y la atención personalizada, aspiramos a ser el socio confiable para aquellos que buscan aprovechar al máximo las oportunidades que ofrece la IoT, incluyendo la provisión de aplicaciones y soluciones en la nube que potencien aún más la experiencia de conectividad.",
          ),
        ),
      ),
      ResponsiveGridCol(
        lg: 6,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: _TextPreguntas(
            title: "Qué hacemos",
            description:
                "Ofrecemos equipos y soluciones de vanguardia que no solo mejoran la comodidad y la seguridad, sino que también contribuyen a la construcción de ciudades más inteligentes y sostenibles.",
          ),
        ),
      ),
      ResponsiveGridCol(
        lg: 6,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: _TextPreguntas(
            title: "Dónde trabajamos",
            description:
                "Nos encontramos en la ciudad de Cuenca en las calles (Nicanor Aguilar 3-74 y, Cuenca 010204), trabajamos a nivel Nacional e Internacional.",
          ),
        ),
      ),
    ]);
  }
}

class _TextPreguntas extends StatelessWidget {
  final String title;
  final String description;
  const _TextPreguntas({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vollkorn(
          title,
          40,
          Colors.black,
        ),
        encodeSans(description, context.width < 779 ? 15 : 18, Colors.black)
      ],
    );
  }
}
