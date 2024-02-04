import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class Vision extends GetResponsiveView {
  Vision({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 850 ? true : false;
    double width = context.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          isMobile ? 15 : width / 10, 10, isMobile ? 15 : width / 10, 10),
      child: _Panel(),
    );
  }
}

class _Panel extends GetResponsiveView {
  _Panel();

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return ResponsiveGridRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveGridCol(
          lg: 6,
          child: ResponsiveGridRow(children: [
            ResponsiveGridCol(
              child: Center(
                child: largeBoldTextBlack('Vision'),
              ),
            ),
            ResponsiveGridCol(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Center(
                  child: Text(
                    "En SmartTelecom, visualizamos un mundo interconectado en el que cada dispositivo, cada hogar y cada ciudad estén unidos a través del Internet de las Cosas. Nos esforzamos por liderar la transformación de la forma en que vivimos y trabajamos, impulsando la adopción masiva de soluciones inteligentes en todas las áreas de la vida. Como parte de nuestra visión, nos comprometemos a ofrecer servicios de aplicaciones y soluciones en la nube que complementen nuestros productos, creando un ecosistema completo y fluido para la conectividad. A medida que avanzamos, forjamos alianzas estratégicas, expandimos nuestra cartera de productos y nos convertimos en un motor de cambio positivo para la sociedad y el medio ambiente. ",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color.fromARGB(250, 171, 188, 204),
                        fontSize: width < 850 ? 15 : 25),
                  ),
                ),
              ),
            ),
          ]),
        ),
        ResponsiveGridCol(
            lg: 6,
            child: Center(child: Image.asset("images/ilustraciones/4.png")))
      ],
    );
  }
}
