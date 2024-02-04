import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:smarttelecom/routes/app_routes.dart';

class ServiciosSection extends StatelessWidget {
  const ServiciosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      children: [
        ResponsiveGridCol(
          lg: 12,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: vollkorn("Únete a nosotros: juntos por un futuro mejor",
                    48, Colors.black)),
          ),
        ),
        ResponsiveGridCol(
          lg: 4,
          child: const _CardService(
            image: "images/ilustraciones/3.png",
            title: "Gestión de dispositivos de Internet de las Cosas (IoT)",
            subTitle:
                "La gestión de dispositivos IoT es el proceso que ayuda a las empresas e ISP a gestionar de forma remota la infraestructura,  puntos finales de su red y obtener datos para la toma de decisiones.",
          ),
        ),
        ResponsiveGridCol(
          lg: 4,
          child: const _CardService(
            image: "images/ilustraciones/4.png",
            title: "Funciones de servicio mejoradas.",
            subTitle:
                "Nuestra empresa ofrece una gama se servicios adicionales para mejorar su experiencia.",
          ),
        ),
        ResponsiveGridCol(
          lg: 4,
          child: const _CardService(
            image: "images/ilustraciones/5.png",
            title: "Transformando industrias con soluciones de IoT",
            subTitle:
                "Nuestras soluciones de IoT de vanguardia permiten a las empresas optimizar las operaciones, mejorar la productividad e impulsar el crecimiento. Con nuestra tecnología innovadora, puede desbloquear nuevas posibilidades y mantenerse a la vanguardia en el mundo digital actual.",
          ),
        ),
        ResponsiveGridCol(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: OutlinedButton(
                onPressed: () => Get.toNamed(AppRoutes.SERVICIOS),
                style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                child: const Text(
                  "Más información",
                  style: TextStyle(
                    color: Color.fromRGBO(107, 117, 126, 1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardService extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const _CardService(
      {required this.image, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: Color.fromRGBO(222, 225, 230, 1))),
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: encodeSans(title, 20, Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: encodeSans(
                  subTitle, 14, const Color.fromRGBO(107, 117, 126, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
