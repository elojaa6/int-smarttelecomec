// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/global/re_usable_button.dart';
import 'package:smarttelecom/routes/app_routes.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({super.key});

  @override
  topBarContentsState createState() => topBarContentsState();
}

class topBarContentsState extends State<TopBarContents> {
  final List isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = Get.context!;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 16,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.INICIO),
              child: Image.asset(
                'images/ST BLUEV3 400.png',
              ),
            ),
            SizedBox(width: screenSize.width / 15),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? isHovering[0] = true : isHovering[0] = false;
                });
              },
              onTap: () => Get.toNamed(AppRoutes.INICIO),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Inicio',
                    style: TextStyle(
                        color: isHovering[0]
                            ? const Color.fromRGBO(69, 99, 127, 50)
                            : const Color.fromRGBO(171, 188, 204, 50),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: isHovering[0],
                    child: Container(
                      height: 2,
                      width: 80,
                      color: const Color.fromRGBO(106, 117, 127, 50),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: screenSize.width / 15),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? isHovering[1] = true : isHovering[1] = false;
                });
              },
              onTap: () => Get.toNamed(AppRoutes.NOSOTROS),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sobre Nosotros',
                    style: TextStyle(
                        color: isHovering[1]
                            ? const Color.fromRGBO(69, 99, 127, 50)
                            : const Color.fromRGBO(171, 188, 204, 50),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: isHovering[1],
                    child: Container(
                      height: 2,
                      width: 80,
                      color: const Color.fromRGBO(106, 117, 127, 50),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: screenSize.width / 15),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? isHovering[2] = true : isHovering[2] = false;
                });
              },
              onTap: () => Get.toNamed(AppRoutes.PRODUCTOS),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Productos',
                    style: TextStyle(
                        color: isHovering[2]
                            ? const Color.fromRGBO(69, 99, 127, 50)
                            : const Color.fromRGBO(171, 188, 204, 50),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: isHovering[2],
                    child: Container(
                      height: 2,
                      width: 80,
                      color: const Color.fromRGBO(106, 117, 127, 50),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: screenSize.width / 15),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? isHovering[3] = true : isHovering[3] = false;
                });
              },
              onTap: () => Get.toNamed(AppRoutes.SERVICIOS),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Servicios',
                    style: TextStyle(
                        color: isHovering[3]
                            ? const Color.fromRGBO(69, 99, 127, 50)
                            : const Color.fromRGBO(171, 188, 204, 50),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: isHovering[3],
                    child: Container(
                      height: 2,
                      width: 80,
                      color: const Color.fromRGBO(106, 117, 127, 50),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: screenSize.width / 15),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? isHovering[4] = true : isHovering[4] = false;
                });
              },
              onTap: () {
                externo(Uri.parse("web.smarttelecomec.com/app/"));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SmartIOT',
                    style: TextStyle(
                        color: isHovering[4]
                            ? const Color.fromRGBO(69, 99, 127, 50)
                            : const Color.fromRGBO(171, 188, 204, 50),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: isHovering[4],
                    child: Container(
                      height: 2,
                      width: 80,
                      color: const Color.fromRGBO(106, 117, 127, 50),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: screenSize.width / 15),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? isHovering[5] = true : isHovering[5] = false;
                });
              },
              onTap: () => Get.toNamed(AppRoutes.CONTACTO),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Contacto',
                    style: TextStyle(
                        color: isHovering[5]
                            ? const Color.fromRGBO(69, 99, 127, 50)
                            : const Color.fromRGBO(171, 188, 204, 50),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: isHovering[5],
                    child: Container(
                      height: 2,
                      width: 80,
                      color: const Color.fromRGBO(106, 117, 127, 50),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
