class Chat {
  String text;
  bool? isUser;
  String? image;
  List<Map<String, String>>? buttons;

  Chat({
    required this.text,
    required this.isUser,
    this.image,
    this.buttons,
  });

  factory Chat.fromJson(Map<String, dynamic> map) => Chat(
        text: map['text'] as String,
        isUser: map['isUser'] != null ? map['isUser'] as bool : null,
        image: map['image'] != null ? map['image'] as String : null,
        buttons: map['buttons'] != null
            ? List<Map<String, String>>.from(
                (map['buttons'] as List<dynamic>).map<Map<String, String>>(
                  (button) =>
                      Map<String, String>.from(button as Map<String, dynamic>),
                ),
              )
            : null,
      );

  Map<String, dynamic> toJson() =>
      {'text': text, 'isUser': isUser, 'image': image, 'buttons': buttons};

  static List<Chat> listFromJson(List<dynamic> list) =>
      List<Chat>.from(list.map((e) => Chat.fromJson(e)));
}
