import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/global/globals.dart';
import 'package:smarttelecom/modules/producto/sections/sections_productos.dart';

class ProductoPage extends GetResponsiveView<ChatController> {
  ProductoPage({super.key});

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
              TopProductos(),
              MenuCategoria(),
              ProductosSection(),
              FooterPanel()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return MyChat(chatController: controller);
              });
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
