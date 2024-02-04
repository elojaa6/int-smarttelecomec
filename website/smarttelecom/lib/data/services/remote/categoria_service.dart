import 'package:get/get.dart';
import 'package:smarttelecom/data/model/categoria.dart';
import 'package:smarttelecom/data/services/remote/api/api.dart';

class CategoriaService extends GetxService {
  Future<List<Categoria>?> getAllCategorias() async {
    try {
      var result =
          await TelecomApi.get('/api/categoria/obtenerTodasLasCategorias');
      return (result as List).map((e) => Categoria.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
