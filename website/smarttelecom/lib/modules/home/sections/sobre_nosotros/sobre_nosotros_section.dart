import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:video_player/video_player.dart';

class SobreNosotrosSection extends StatelessWidget {
  const SobreNosotrosSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 850 ? true : false;
    double width = context.width;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(
          isMobile ? 15 : width / 10, 10, isMobile ? 15 : width / 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        image: const DecorationImage(
            image: AssetImage('images/bg/about.png'), fit: BoxFit.cover),
      ),
      child: const _Panel(),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel();

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.all(width < 600 ? 20 : 50),
        child: const _Info(),
      ),
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
        ResponsiveGridCol(lg: 6, child: const _About()),
        ResponsiveGridCol(lg: 6, child: const _VideoPlayer()),
      ],
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  const _VideoPlayer();

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset("images/videos/video.mp4");
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      allowFullScreen: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        ),
      ),
    );
  }
}

class _About extends StatelessWidget {
  const _About();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
            child: vollkorn("Acerca de Nosotros", 48,
                const Color.fromRGBO(107, 117, 126, 1))),
        ResponsiveGridCol(
          child: encodeSans(
              "En SmartTelecom, estamos dedicados a llevar la innovación del Internet de las Cosas (IoT) a cada aspecto de tu vida.",
              18,
              Colors.black),
        ),
        ResponsiveGridCol(
          child: const _ExpancionTile(
              title: "Quiénes somos",
              lisTitle:
                  "Somos líderes en la venta de equipos avanzados de domótica, seguridad y soluciones IoT diseñadas para crear hogares inteligentes, ciudades conectadas y comunidades más eficientes."),
        ),
        ResponsiveGridCol(
          child: const _ExpancionTile(
              title: "Qué hacemos",
              lisTitle:
                  "Ofrecemos equipos y soluciones de vanguardia que no solo mejoran la comodidad y la seguridad, sino que también contribuyen a la construcción de ciudades más inteligentes y sostenibles."),
        ),
        ResponsiveGridCol(
          child: const _ExpancionTile(
            title: "Cómo ayudamos",
            lisTitle:
                "A través de la innovación constante, la calidad excepcional y la atención personalizada, aspiramos a ser el socio confiable para aquellos que buscan aprovechar al máximo las oportunidades que ofrece la IoT, incluyendo la provisión de aplicaciones y soluciones en la nube que potencien aún más la experiencia de conectividad.",
          ),
        ),
        ResponsiveGridCol(
          child: const _ExpancionTile(
              title: "Dónde trabajamos",
              lisTitle:
                  "Nos encontramos en la ciudad de Cuenca en las calles (Nicanor Aguilar 3-74 y, Cuenca 010204), trabajamos a nivel Nacional e Internacional."),
        ),
      ],
    );
  }
}

class _ExpancionTile extends StatelessWidget {
  final String title;
  final String lisTitle;

  const _ExpancionTile({required this.title, required this.lisTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ExpansionTile(
        title: encodeSans(title, 18, Colors.black),
        children: [
          ListTile(
            title: Text(lisTitle),
          )
        ],
      ),
    );
  }
}
