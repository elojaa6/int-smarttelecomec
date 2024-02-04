import 'package:get/get.dart';
import 'package:smarttelecom/data/services/remote/categoria_service.dart';
import 'package:smarttelecom/data/services/remote/producto_service.dart';
import 'package:smarttelecom/data/services/remote/sub_categoria_service.dart';
import 'package:smarttelecom/modules/producto/producto_controller.dart';

class ProductoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductoController>(() => ProductoController());

    Get.lazyPut<CategoriaService>(() => CategoriaService());
    Get.lazyPut<SubCategoriaService>(() => SubCategoriaService());
    Get.lazyPut<ProductoService>(() => ProductoService());
  }
}
