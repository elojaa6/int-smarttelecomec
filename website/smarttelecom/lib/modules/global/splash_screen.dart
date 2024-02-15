import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Navega a la página de inicio después de la carga
      Get.offAllNamed(AppRoutes
          .INICIO); // Asegúrate de reemplazar AppRoutes.INICIO por tu ruta de inicio real
    });

    // Mientras tanto, muestra la pantalla de carga
    return Scaffold(
      body: Center(
        child:
            Image.asset('images/STEHC.png'), // Reemplaza con tu imagen de carga
      ),
    );
  }
}
