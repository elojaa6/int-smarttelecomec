import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/global/globals.dart';
import 'package:smarttelecom/modules/home/sections/sections_home.dart';
import 'package:smarttelecom/modules/home/widget/slideshow.dart';

class HomePage extends GetResponsiveView<ChatController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = context.width;
    return Scaffold(
      appBar: screenSize < 1100
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
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              FadeIn(child: TopSection()),
              const SizedBox(height: 40),
              const SlidesShow(),
              const SizedBox(height: 40),
              const SobreNosotrosSection(),
              const ServiciosSection(),
              const ProductosSection(),
              FooterPanel(),
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
