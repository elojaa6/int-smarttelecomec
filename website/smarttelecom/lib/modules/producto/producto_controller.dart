import 'package:get/get.dart';
import 'package:smarttelecom/data/model/categoria.dart';
import 'package:smarttelecom/data/model/producto.dart';
import 'package:smarttelecom/data/model/sub_categoria.dart';
import 'package:smarttelecom/data/services/remote/categoria_service.dart';
import 'package:smarttelecom/data/services/remote/producto_service.dart';
import 'package:smarttelecom/data/services/remote/sub_categoria_service.dart';

class ProductoController extends GetxController {
  //*Servicios
  CategoriaService categoriaService = Get.find<CategoriaService>();
  SubCategoriaService subCategoriaService = Get.find<SubCategoriaService>();
  ProductoService productoService = Get.find<ProductoService>();

  //* Listas
  RxList<Categoria> categorias = <Categoria>[].obs;
  RxList<SubCategoria> subCategorias = <SubCategoria>[].obs;
  RxList<Producto> productos = <Producto>[].obs;

  RxInt categoriaSeleccionadaId = 0.obs;
  RxInt subCategoriaSeleccionadaId = 0.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    try {
      categorias.value = (await categoriaService.getAllCategorias())!;

      print(categorias);

      subCategorias.value = (await subCategoriaService
          .getSubCategoriasById(categorias.first.categoriaId!))!;

      productos.value = (await productoService.getAllProductosBySubCategoria(
          subCategorias.first.subcategoriasHijas!.first.subcategoriaId!))!;
      /*subCategorias.value =
          (await subCategoriaService.getSubCategoriasById(1))!;*/

      //productosSubCategorias();
    } catch (e) {
      print(e);
    }
  }

  categoriasChange() async {
    subCategorias.value = (await subCategoriaService
        .getSubCategoriasById(categoriaSeleccionadaId.value))!;
  }

  productosSubCategorias() async {
    productos.value = (await productoService
        .getAllProductosBySubCategoria(subCategoriaSeleccionadaId.value))!;
  }
}
