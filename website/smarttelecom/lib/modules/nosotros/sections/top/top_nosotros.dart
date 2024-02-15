import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class TopNosotros extends StatelessWidget {
  const TopNosotros({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('images/bg/12.png'), fit: BoxFit.cover),
        ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveGridCol(
          lg: 6,
          child: const _TextComplete(),
        ),
        ResponsiveGridCol(
          lg: 6,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("images/products/4.jpeg"),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextComplete extends StatelessWidget {
  const _TextComplete();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          child: openSans(
              "Nuestra Historia!", context.width < 779 ? 32 : 52, Colors.black),
        ),
        ResponsiveGridCol(
            child: manrope(
                "En el corazón de Cuenca, nace Smart Telecom, una empresa visionaria dedicada a revolucionar el mundo del Internet de las Cosas (IoT) a través de la innovadora tecnología LoRaWAN. Smart Telecom se embarca en la misión de transformar la vida cotidiana y las operaciones empresariales ofreciendo productos IoT de vanguardia. Desde soluciones para la agricultura inteligente hasta sistemas de monitorización urbana, su oferta promete no solo una mayor eficiencia y sostenibilidad sino también el nacimiento de ciudades más inteligentes. Con un compromiso incansable por la innovación y la calidad, Smart Telecom se posiciona rápidamente como líder en el mercado de Cuenca, marcando el inicio de una nueva era en conectividad y tecnología ambiental.",
                context.width < 779 ? 15 : 18,
                Colors.black))
      ],
    );
  }
}
