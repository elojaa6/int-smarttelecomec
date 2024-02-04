import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/contacto/sections/map/google_maps.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class TopContacto extends StatelessWidget {
  const TopContacto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('images/bg/form_top.png'), fit: BoxFit.cover),
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
          // child: const _TextBold(text: "Contactenos hoy mismo!"),
          child: Center(
              child: openSans(
                  "Contactenos hoy mismo!",
                  context.width < 779 ? 28 : 52,
                  const Color.fromRGBO(107, 117, 126, 1))),
        ),
        ResponsiveGridCol(
          // child: const _TextBold(text: "Contactenos hoy mismo!"),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: montserrat(
                "Estamos aqui para ayudarte. No dude en comunicarse con nosotros",
                context.width < 779 ? 18 : 24,
                Colors.black),
          )),
        ),
        ResponsiveGridCol(
          md: 4,
          xs: 12,
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: _ContactosCard(
                icon: Icons.email_outlined,
                tipo: "Correo electronico",
                mensaje: "!Envianos un correo hoy!",
                contacto: "correo@gmail.com"),
          ),
        ),
        ResponsiveGridCol(
          md: 4,
          xs: 12,
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: _ContactosCard(
                icon: Icons.local_phone_outlined,
                tipo: "Correo electronico",
                mensaje: "!Llamenos ahora!",
                contacto: "(07) 403-4622"),
          ),
        ),
        ResponsiveGridCol(
          md: 4,
          xs: 12,
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: _ContactosCard(
              icon: Icons.location_on_outlined,
              tipo: "Oficina",
              mensaje: "Nicanor Aguilar 3-74 y, Cuenca 010204",
              contacto: "",
            ),
          ),
        ),
        ResponsiveGridCol(child: const GoogleMapsIframe())
      ],
    );
  }
}

class _ContactosCard extends StatelessWidget {
  final IconData icon;
  final String tipo;
  final String mensaje;
  final String? contacto;

  const _ContactosCard({
    required this.icon,
    required this.tipo,
    required this.mensaje,
    this.contacto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        _TextSmall(text: tipo),
        Text(mensaje),
        Text(contacto!)
      ],
    );
  }
}

class _TextSmall extends StatelessWidget {
  final String text;
  const _TextSmall({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 1.5,
        ),
      ),
    );
  }
}
