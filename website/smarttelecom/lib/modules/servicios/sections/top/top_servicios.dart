import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class TopServicios extends StatelessWidget {
  const TopServicios({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: raleway("Transformando el Futuro!",
                context.width < 779 ? 32 : 52, Colors.black),
          ),
        ),
        ResponsiveGridCol(
          lg: 6,
          child: openSans(
              "Bienvenido a nuestra empresa, donde nos especializamos en ofrecer productos IoT y LoRaWAN de vanguardia. Nuestras soluciones innovadoras están diseñadas para transformar la forma en que vive, trabaja y se conecta con el mundo. Únase a nosotros en este emocionante viaje hacia un futuro más inteligente.",
              context.width < 779 ? 15 : 18,
              Colors.black),
        ),
      ],
    );
  }
}
