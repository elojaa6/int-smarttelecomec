import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:smarttelecom/modules/global/re_usable_button.dart';
import 'package:smarttelecom/routes/app_routes.dart';

// ignore: must_be_immutable
class FooterPanel extends StatelessWidget {
  FooterPanel({super.key});

  late bool isMobile, isDesktop;

  @override
  Widget build(BuildContext context) {
    isMobile = Get.context!.width < 850 ? true : false;
    isDesktop = Get.context!.width > 850 ? true : false;

    // double width = MediaQuery.of(context).size.width;
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromRGBO(51, 57, 66, 1)),
        child: ResponsiveGridRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveGridCol(md: 6, child: socialNetwork()),
            ResponsiveGridCol(md: 6, child: smartInfo())
          ],
        ));
  }

  Widget socialNetwork() => Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
                md: 12, child: footerBlackText('¡Sigamos en contacto!')),
            ResponsiveGridCol(
                md: 12,
                child: footerGreyText(
                    'Encuéntranos en estas plataformas, respondemos en 1-2 días laborables.')),
            ResponsiveGridCol(
              child: ResponsiveGridRow(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ResponsiveGridCol(
                    md: 2,
                    child: IconButtonCustom(
                      icon: FontAwesomeIcons.facebook,
                      onPressed: () {},
                      overColor: Colors.blue,
                    ),
                  ),
                  ResponsiveGridCol(
                    md: 2,
                    child: IconButtonCustom(
                      icon: FontAwesomeIcons.instagram,
                      onPressed: () {},
                      overColor: Colors.pink,
                    ),
                  ),
                  ResponsiveGridCol(
                    md: 2,
                    child: IconButtonCustom(
                      icon: FontAwesomeIcons.xTwitter,
                      onPressed: () {},
                      overColor: Colors.black,
                    ),
                  ),
                  ResponsiveGridCol(
                    md: 2,
                    child: IconButtonCustom(
                      icon: FontAwesomeIcons.threads,
                      onPressed: () {},
                      overColor: Colors.black,
                    ),
                  ),
                  ResponsiveGridCol(
                    md: 2,
                    child: IconButtonCustom(
                      icon: FontAwesomeIcons.youtube,
                      onPressed: () {},
                      overColor: Colors.red,
                    ),
                  ),
                  ResponsiveGridCol(
                    md: 2,
                    child: IconButtonCustom(
                      icon: FontAwesomeIcons.whatsapp,
                      onPressed: () {},
                      overColor: Colors.green,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget smartInfo() => Container(
        margin: const EdgeInsets.all(20),
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(md: 6, child: useFulLink()),
            ResponsiveGridCol(md: 6, child: Image.asset("images/LogoHBC.png")),
          ],
        ),
      );

  Widget useFulLink() =>
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        manrope('Empresa', 25, Colors.white),
        textButtons('Inicio', const Color.fromARGB(255, 255, 255, 255),
            () => Get.toNamed(AppRoutes.INICIO)),
        textButtons('Sobre Nosotros', const Color.fromARGB(255, 255, 255, 255),
            () => Get.toNamed(AppRoutes.NOSOTROS)),
        textButtons('Productos', const Color.fromARGB(255, 255, 255, 255),
            () => Get.toNamed(AppRoutes.PRODUCTOS)),
        textButtons('Servicios', const Color.fromARGB(255, 255, 255, 255),
            () => Get.toNamed(AppRoutes.SERVICIOS)),
        textButtons('SmartIOT', const Color.fromARGB(255, 255, 255, 255),
            () => externo(Uri.parse("https://www.google.com/"))),
        textButtons('Contacto', const Color.fromARGB(255, 255, 255, 255),
            () => Get.toNamed(AppRoutes.NOSOTROS)),
        textButtons('Zoho Mail', const Color.fromARGB(255, 255, 255, 255),
            () => externo(Uri.parse("https://accounts.zoho.com/"))),
      ]);
}

class IconButtonCustom extends StatefulWidget {
  const IconButtonCustom({
    super.key,
    required this.icon,
    required this.onPressed,
    this.overColor = Colors.yellow,
  });

  final IconData icon;
  final Function onPressed;
  final Color overColor;

  @override
  State<IconButtonCustom> createState() => _IconButtonCustomState();
}

class _IconButtonCustomState extends State<IconButtonCustom> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: MouseRegion(
        onEnter: (event) => setState(() => isHover = true),
        onExit: (event) => setState(() => isHover = false),
        child: IconButton(
          onPressed: () => widget.onPressed(),
          icon: FaIcon(
            widget.icon,
            color: isHover ? widget.overColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
