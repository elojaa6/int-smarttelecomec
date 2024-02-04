class ImagenesProducto {
  int? imagenId;
  String? name;
  String? type;
  String? filePath;

  ImagenesProducto({
    this.imagenId,
    this.name,
    this.type,
    this.filePath,
  });

  factory ImagenesProducto.fromJson(Map<String, dynamic> json) =>
      ImagenesProducto(
        imagenId: json["imagenId"],
        name: json["name"],
        type: json["type"],
        filePath: json["filePath"],
      );

  Map<String, dynamic> toJson() => {
        "imagenId": imagenId,
        "name": name,
        "type": type,
        "filePath": filePath,
      };

  static List<ImagenesProducto> listFromJson(List<dynamic> list) =>
      List<ImagenesProducto>.from(
          list.map((e) => ImagenesProducto.fromJson(e)));
}
