import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class Section2Servicios extends StatelessWidget {
  const Section2Servicios({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vollkorn("Transformando industrias con soluciones de IoT",
                  context.width < 779 ? 32 : 52, Colors.black),
              manrope(
                  "Nuestras soluciones de IoT de vanguardia permiten a las empresas optimizar las operaciones, mejorar la productividad e impulsar el crecimiento. Con nuestra tecnología innovadora, puede desbloquear nuevas posibilidades y mantenerse a la vanguardia en el mundo digital actual",
                  context.width < 779 ? 14 : 18,
                  Colors.black)
            ],
          ),
        ),
        ResponsiveGridCol(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              leading: const Icon(Icons.computer),
              title: manrope(
                  "Agilice los procesos y aumente la eficienta con nuestros dispositivos IoT avanzados.",
                  18,
                  Colors.black),
            ),
          ),
        ),
        ResponsiveGridCol(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              leading: const Icon(Icons.computer),
              title: manrope(
                  "Supervise y analice datos en tiempo real para obtener información útil.",
                  18,
                  Colors.black),
            ),
          ),
        ),
        ResponsiveGridCol(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              leading: const Icon(Icons.computer),
              title: manrope(
                  "Mejore la toma de decisiones e impulse los resultados comerciales con análisis de IoT.",
                  context.width < 779 ? 15 : 18,
                  Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
