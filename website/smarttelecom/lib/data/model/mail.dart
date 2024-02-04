class Mail {
  String? asunto;
  String? emailUser;
  String? mensaje;

  Mail({
    this.asunto,
    this.emailUser,
    this.mensaje,
  });

  factory Mail.fromJson(Map<String, dynamic> json) => Mail(
        asunto: json["asunto"],
        emailUser: json["emailUser"],
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toJson() => {
        "asunto": asunto,
        "emailUser": emailUser,
        "mensaje": mensaje,
      };

  static List<Mail> listFromJson(List<dynamic> list) =>
      List<Mail>.from(list.map((e) => Mail.fromJson(e)));
}
