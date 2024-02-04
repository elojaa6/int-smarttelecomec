class ArchivosPdf {
  int? pdfId;
  String? name;
  String? archivoPdf;

  ArchivosPdf({
    this.pdfId,
    this.name,
    this.archivoPdf,
  });

  factory ArchivosPdf.fromJson(Map<String, dynamic> json) => ArchivosPdf(
        pdfId: json["pdfId"],
        name: json["name"],
        archivoPdf: json["archivoPdf"],
      );

  Map<String, dynamic> toJson() => {
        "pdfId": pdfId,
        "name": name,
        "archivoPdf": archivoPdf,
      };

  static List<ArchivosPdf> listFromJson(List<dynamic> list) =>
      List<ArchivosPdf>.from(list.map((e) => ArchivosPdf.fromJson(e)));
}
