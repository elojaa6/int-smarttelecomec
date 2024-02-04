import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class EquipoNosotros extends StatelessWidget {
  const EquipoNosotros({super.key});

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
                child: vollkorn("Conoce a Nuestro Equipo", 40,
                    const Color.fromRGBO(107, 117, 126, 1))),
          ),
        ),
        ResponsiveGridCol(
          lg: 4,
          child: const _CardTeam(
            image: "images/team/1.jpg",
            title: "Hola ",
            work: "Desarrollador",
            url: "https://www.google.com/",
          ),
        ),
        ResponsiveGridCol(
          lg: 4,
          child: const _CardTeam(
            image: "images/team/3.jpg",
            title: "Hola 1",
            work: "Ingeniera",
            url: "https://www.google.com/",
          ),
        ),
        ResponsiveGridCol(
          lg: 4,
          child: const _CardTeam(
            image: "images/team/2.jpg",
            title: "Hola 2",
            work: "Especialista",
            url: "https://www.google.com/",
          ),
        ),
      ],
    );
  }
}

class _CardTeam extends StatefulWidget {
  final String image;
  final String title;
  final String work;
  final String url;
  const _CardTeam(
      {required this.image,
      required this.title,
      required this.work,
      required this.url});

  @override
  State<_CardTeam> createState() => _CardTeamState();
}

class _CardTeamState extends State<_CardTeam> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      height: 400,
      width: 330.0,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: Container(
              height: 400.0,
              width: 330.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white //Colors.grey.withOpacity(0.2),
                  ),
            ),
          ),
          /*Align(
            alignment: const Alignment(0, -1),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60.0)),
              child: _NavigationIcons(stateOfIcon: animate, url: widget.url),
            ),
          ),*/
          Align(
            alignment: const Alignment(0, 1),
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 180),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                child: poppins(widget.title, 16.0, Colors.black),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1.1),
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 180),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                child: encodeSans(
                    widget.work, 16.0, const Color.fromRGBO(145, 148, 161, 1)),
              ),
            ),
          ),
          MouseRegion(
            onEnter: (a) {
              setState(() {
                animate = true;
              });
            },
            onHover: (a) {
              setState(() {
                animate = true;
              });
            },
            onExit: (a) {
              setState(() {
                animate = false;
              });
            },
            child: Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 275),
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                height: animate ? 290 : 430,
                width: animate ? 230 : 370.0,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NavigationIcons extends StatefulWidget {
  final bool stateOfIcon;
  final String url;
  const _NavigationIcons({required this.stateOfIcon, required this.url});

  @override
  State<_NavigationIcons> createState() => __NavigationIconsState();
}

class __NavigationIconsState extends State<_NavigationIcons> {
  bool animate1 = false;
  bool animate2 = false;
  bool animate3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
      padding: const EdgeInsets.all(15),
      height: 57.0,
      width: 330,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              top: widget.stateOfIcon ? 0 : -100,
              left: 50.0,
              duration: const Duration(milliseconds: 275),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(
                      AntDesign.instagram,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(
                      AntDesign.facebook_square,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(
                      AntDesign.linkedin_square,
                      size: 26.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(
                      AntDesign.youtube,
                      size: 26.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
