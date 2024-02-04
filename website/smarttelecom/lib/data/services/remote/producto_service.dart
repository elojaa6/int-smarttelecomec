import 'package:get/get.dart';
import 'package:smarttelecom/data/model/producto.dart';
import 'package:smarttelecom/data/services/remote/api/api.dart';

class ProductoService extends GetxService {
  Future<List<Producto>?> getAllProductosBySubCategoria(int id) async {
    try {
      var result = await TelecomApi.get('/api/producto/por-subcategoria/$id');
      return (result as List).map((e) => Producto.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
