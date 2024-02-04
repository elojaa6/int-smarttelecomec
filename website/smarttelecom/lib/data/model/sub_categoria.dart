import 'package:smarttelecom/data/model/producto.dart';

class SubCategoria {
  int? subcategoriaId;
  String? nombreSubcategoria;
  String? descripcionSubcategoria;
  List<Producto>? productos;
  List<SubCategoria>? subcategoriasHijas;

  SubCategoria({
    this.subcategoriaId,
    this.nombreSubcategoria,
    this.descripcionSubcategoria,
    this.productos,
    this.subcategoriasHijas,
  });

  factory SubCategoria.fromJson(Map<String, dynamic> json) => SubCategoria(
        subcategoriaId: json["subcategoriaId"],
        nombreSubcategoria: json["nombreSubcategoria"],
        descripcionSubcategoria: json["descripcionSubcategoria"],
        productos: json["productos"] == null
            ? []
            : List<Producto>.from(
                json["productos"]!.map((x) => Producto.fromJson(x))),
        subcategoriasHijas: json["subcategoriasHijas"] == null
            ? []
            : List<SubCategoria>.from(json["subcategoriasHijas"]!
                .map((x) => SubCategoria.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subcategoriaId": subcategoriaId,
        "nombreSubcategoria": nombreSubcategoria,
        "descripcionSubcategoria": descripcionSubcategoria,
        "productos": productos == null
            ? []
            : List<dynamic>.from(productos!.map((x) => x.toJson())),
        "subcategoriasHijas": subcategoriasHijas == null
            ? []
            : List<dynamic>.from(subcategoriasHijas!.map((x) => x.toJson())),
      };

  static List<SubCategoria> listFromJson(List<dynamic> list) =>
      List<SubCategoria>.from(list.map((e) => SubCategoria.fromJson(e)));
}
