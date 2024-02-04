import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:smarttelecom/data/model/cards_model.dart';
import 'package:smarttelecom/routes/app_routes.dart';

class ProductosSection extends StatelessWidget {
  const ProductosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          image: const DecorationImage(
              image: AssetImage('images/bg/bp.png'), fit: BoxFit.cover),
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
      child: ResponsiveGridRow(children: [
        ResponsiveGridCol(
          child: Center(
            child:
                vollkorn("Un vistazo a nuestros Productos", 48, Colors.white),
          ),
        ),
        ResponsiveGridCol(child: const _Info()),
        ResponsiveGridCol(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: OutlinedButton(
                onPressed: () => Get.toNamed(AppRoutes.PRODUCTOS),
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                child: const Text(
                  "Ver más",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _Info extends StatefulWidget {
  const _Info();

  @override
  State<_Info> createState() => _InfoState();
}

class _InfoState extends State<_Info> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          InteractiveCard(
            image: tarjetas[0].image!,
            title: tarjetas[0].title!,
            description: tarjetas[0].description!,
          ),
          InteractiveCard(
            image: tarjetas[1].image!,
            title: tarjetas[1].title!,
            description: tarjetas[1].description!,
          ),
          InteractiveCard(
            image: tarjetas[2].image!,
            title: tarjetas[2].title!,
            description: tarjetas[2].description!,
          ),
          InteractiveCard(
            image: tarjetas[3].image!,
            title: tarjetas[3].title!,
            description: tarjetas[3].description!,
          )
        ],
      ),
    );
  }
}

class InteractiveCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  const InteractiveCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<InteractiveCard> createState() => _Interactivetarjetastate();
}

class _Interactivetarjetastate extends State<InteractiveCard> {
  double height = 300.0;
  double width = 100.0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          height = 340.0;
          width = 340.0;
        });
      },
      onEnter: (event) {
        setState(() {
          height = 340.0;
          width = 340.0;
        });
      },
      onExit: (event) {
        setState(() {
          height = 300.0;
          width = 100.0;
        });
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10.0),
        duration: const Duration(milliseconds: 575),
        curve: Curves.easeOut,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(widget.image)),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: const LinearGradient(colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.black,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedRotation(
                duration: const Duration(milliseconds: 375),
                turns: height == 300.0 ? -1 / 4 : 0,
                curve: Curves.easeOut,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 375),
                  padding: EdgeInsets.symmetric(
                      vertical: height == 300.0 ? 20.0 : 0.0),
                  child: Text(
                    widget.title,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                curve: Curves.easeOut,
                height: height == 300 ? 40.0 : 80.0,
                width: 320.0,
                color: Colors.transparent,
                padding: EdgeInsets.only(
                  top: height == 300 ? 100.0 : 20.0,
                ),
                clipBehavior: Clip.antiAlias,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 375),
                  opacity: height == 300 ? 0.0 : 1.0,
                  child: OverflowBox(
                    minWidth: 300.0,
                    minHeight: 80.0,
                    maxHeight: 100.0,
                    maxWidth: 320.0,
                    child: Text(
                      widget.description,
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
