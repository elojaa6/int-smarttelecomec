class Categoria {
  int? categoriaId;
  String? nombreCategoria;
  String? descripcionCategoria;

  Categoria({
    this.categoriaId,
    this.nombreCategoria,
    this.descripcionCategoria,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        categoriaId: json["categoriaId"],
        nombreCategoria: json["nombreCategoria"],
        descripcionCategoria: json["descripcionCategoria"],
      );

  Map<String, dynamic> toJson() => {
        "categoriaId": categoriaId,
        "nombreCategoria": nombreCategoria,
        "descripcionCategoria": descripcionCategoria,
      };

  static List<Categoria> listFromJson(List<dynamic> list) =>
      List<Categoria>.from(list.map((e) => Categoria.fromJson(e)));
}
