import 'package:get/get.dart';
import 'package:smarttelecom/data/model/sub_categoria.dart';
import 'package:smarttelecom/data/services/remote/api/api.dart';

class SubCategoriaService extends GetxService {
  Future<List<SubCategoria>?> getAllSubCategorias() async {
    try {
      var result =
          await TelecomApi.get('/api/subcategoria/obtenerSubcategoriaPadre');
      return (result as List).map((e) => SubCategoria.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<SubCategoria>?> getSubCategoriasById(int id) async {
    try {
      var result = await TelecomApi.get('/api/subcategoria/categoria/$id');
      return (result as List).map((e) => SubCategoria.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
