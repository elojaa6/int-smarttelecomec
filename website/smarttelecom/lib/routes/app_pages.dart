import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/global/splash_screen.dart';
import 'package:smarttelecom/modules/modules.dart';
import 'package:smarttelecom/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPASH,
      page: () => FadeIn(child: const SplashScreen()),
    ),
    GetPage(
        name: AppRoutes.INICIO,
        page: () => FadeIn(child: HomePage()),
        binding: ChatBinding()),
    GetPage(
        name: AppRoutes.NOSOTROS,
        page: () => FadeIn(child: NosotrosPage()),
        binding: ChatBinding()),
    GetPage(
        name: AppRoutes.PRODUCTOS,
        page: () => FadeIn(child: ProductoPage()),
        //binding: ProductoBinding(),
        bindings: [ChatBinding(), ProductoBinding()]),
    GetPage(
        name: AppRoutes.SERVICIOS,
        page: () => FadeIn(child: ServiciosPage()),
        binding: ChatBinding()),
    GetPage(
        name: AppRoutes.CONTACTO,
        page: () => FadeIn(child: ContactoPage()),
        bindings: [ChatBinding(), MailBinding()]),
  ];
}
