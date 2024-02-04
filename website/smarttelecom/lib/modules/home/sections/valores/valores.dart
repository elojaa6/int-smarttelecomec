import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/home/constants.dart';
import 'package:smarttelecom/data/model/valores_model.dart';

class Valores extends GetResponsiveView {
  Valores({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isMobile = MediaQuery.of(context).size.width < 850 ? true : false;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      // margin: EdgeInsets.fromLTRB(isMobile ? 15 : width / 10, isMobile ? 0 : 50,
      //     isMobile ? 15 : width / 10, 50),
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFE8F0F9)),
      child: _Panel(),
    );
  }
}

class _Panel extends GetResponsiveView {
  _Panel();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...valores.map((e) => ResponsiveGridCol(
              lg: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _TarjetaInwell(
                    title: e.title, description: e.description, image: e.image),
              ),
            )),
        // ResponsiveGridCol(
        //     child: Card(
        //         clipBehavior: Clip.hardEdge,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30)),
        //         margin: const EdgeInsets.all(15),
        //         elevation: 10,
        //         child: Stack()))
      ],
    );
  }
}

// ignore: unused_element
class _Tarjeta extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;

  const _Tarjeta(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Image.asset(image!, fit: BoxFit.fill),
          Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Title(
                      color: Colors.white,
                      child: Text(
                        title!,
                        style: const TextStyle(color: Colors.white),
                      )),
                  Text(
                    description!,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class _TarjetaInwell extends StatefulWidget {
  final String? title;
  final String? description;
  final String? image;

  const _TarjetaInwell(
      {required this.title, required this.description, required this.image});

  @override
  State<_TarjetaInwell> createState() => _TarjetaInwellState();
}

class _TarjetaInwellState extends State<_TarjetaInwell> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(
          () {
            isHover = value;
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.asset(
              widget.image!,
              fit: BoxFit.fill,
            ),
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Title(
                          color: Colors.white,
                          child: Text(
                            widget.title!,
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.description!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
