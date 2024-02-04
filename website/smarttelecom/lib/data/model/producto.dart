import 'archivos_pdf.dart';
import 'imagenes_producto.dart';

class Producto {
  int? productoId;
  String? nombreProducto;
  String? descripcionProducto;
  int? precioProducto;
  List<ImagenesProducto>? imagenesProductos;
  List<ArchivosPdf>? archivosPdf;

  Producto({
    this.productoId,
    this.nombreProducto,
    this.descripcionProducto,
    this.precioProducto,
    this.imagenesProductos,
    this.archivosPdf,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        productoId: json["productoId"],
        nombreProducto: json["nombreProducto"],
        descripcionProducto: json["descripcionProducto"],
        precioProducto: json["precioProducto"],
        imagenesProductos: json["imagenesProductos"] == null
            ? []
            : List<ImagenesProducto>.from(json["imagenesProductos"]!
                .map((x) => ImagenesProducto.fromJson(x))),
        archivosPdf: json["archivosPdf"] == null
            ? []
            : List<ArchivosPdf>.from(
                json["archivosPdf"]!.map((x) => ArchivosPdf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productoId": productoId,
        "nombreProducto": nombreProducto,
        "descripcionProducto": descripcionProducto,
        "precioProducto": precioProducto,
        "imagenesProductos": imagenesProductos == null
            ? []
            : List<dynamic>.from(imagenesProductos!.map((x) => x.toJson())),
        "archivosPdf": archivosPdf == null
            ? []
            : List<dynamic>.from(archivosPdf!.map((x) => x.toJson())),
      };

  static List<Producto> listFromJson(List<dynamic> list) =>
      List<Producto>.from(list.map((e) => Producto.fromJson(e)));
}
