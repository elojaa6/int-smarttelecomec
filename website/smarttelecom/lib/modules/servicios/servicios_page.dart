import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/global/globals.dart';
import 'package:smarttelecom/modules/servicios/sections/sections_servicios.dart';

class ServiciosPage extends GetResponsiveView<ChatController> {
  ServiciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = context.width;

    return Scaffold(
      appBar: screenSize < 1080
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "SmarTelecom",
                style: TextStyle(
                    color: Color.fromRGBO(106, 117, 127, 50),
                    fontWeight: FontWeight.w900),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize, 75),
              child: const TopBarContents(),
            ),
      drawer: const NavBarCell(),
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const TopServicios(),
              const Section1Servicios(),
              const Section2Servicios(),
              const Section3Servicios(),
              const Section4Servicios(),
              const Section5Servicios(),
              FooterPanel()
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getOrCreateUserId().then((id) {
            controller.userId.value = id;
          });
          showModalBottomSheet(
              context: context,
              builder: (context) {
                controller.sendFirstMessage();
                return MyChat(chatController: controller);
              });
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
