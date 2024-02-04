import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:smarttelecom/modules/global/re_usable_button.dart';
import 'package:smarttelecom/routes/app_routes.dart';

class NavBarCell extends StatelessWidget {
  const NavBarCell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.asset('images/LogoV.png'),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: montserrat("Inicio", 15, Colors.black),
            onTap: () => Get.toNamed(AppRoutes.INICIO),
          ),
          ListTile(
            leading: const Icon(Icons.people_rounded),
            title: const Text('Sobre Nosotros'),
            onTap: () => Get.toNamed(AppRoutes.NOSOTROS),
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits_outlined),
            title: const Text('Productos'),
            onTap: () => Get.toNamed(AppRoutes.PRODUCTOS),
          ),
          ListTile(
            leading: const Icon(Icons.electrical_services_rounded),
            title: const Text('Servicios'),
            onTap: () => (Get.toNamed(AppRoutes.SERVICIOS)),
          ),
          ListTile(
            leading: const Icon(Icons.computer),
            title: const Text('SmartIOT'),
            onTap: () {
              externo(Uri.parse("https://www.google.com/"));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contacto'),
            onTap: () => Get.toNamed(AppRoutes.CONTACTO),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Zoho Mail'),
            onTap: () {
              externo(Uri.parse("https://accounts.zoho.com/"));
            },
          ),
        ],
      ),
    );
  }
}
