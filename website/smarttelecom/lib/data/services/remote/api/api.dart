import 'package:dio/dio.dart';

class TelecomApi {
  static final Dio _dio = Dio();
  //static const String _baseUrl = 'http://localhost/spring';
  //static const String _baseUrl = 'http://spring_boot_app:8080';
  //static const String _baseUrl = 'http://localhost:8060/';
  static const String _baseUrl = 'https://smarttelecomec.com/spring';

  String sessionId = "";

  Future<void> configureDio() async {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  static Future<dynamic> get(String ruta) async {
    try {
      var response = await _dio.get(ruta);

      return response.data;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> post(String ruta, {Map<String, dynamic>? data}) async {
    try {
      var response = await _dio.post(ruta, data: data);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Map<String, dynamic>>> sendMessageToRasa(
      String message) async {
    final List<Map<String, dynamic>> responseMessages = [];

    try {
      final response = await _dio.post(
        //'http://rasa:5005/webhooks/rest/webhook',
        'https://smarttelecomec.com/rasa/webhooks/rest/webhook',
        //'http://localhost/rasa/webhooks/rest/webhook',\
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {'sender': 'test_user', 'message': message},
      );

      if (response.statusCode == 200) {
        responseMessages.add({
          'text': message,
          'isUser': true,
        });

        for (var botMessage in response.data) {
          if (botMessage['buttons'] != null && botMessage['buttons'] is List) {
            final List<Map<String, dynamic>> buttons =
                List<Map<String, dynamic>>.from(botMessage['buttons']);
            responseMessages.add({
              'text': botMessage['text'] ?? '',
              'isUser': false,
              'buttons': buttons,
            });
          } else if (botMessage['image'] != null &&
              botMessage['image'] is List) {
            // Modifica el código para procesar correctamente la URL de la imagen
            final List<String> images = List<String>.from(botMessage['image']);
            responseMessages.add({
              'text': botMessage['text'] ?? '',
              'isUser': false,
              'image': images.isNotEmpty ? images.first : null,
            });
          } else {
            responseMessages.add({
              'text': botMessage['text'] ?? '',
              'isUser': false,
            });
          }
        }

        print(
            '_responseMessages después de la actualización: $responseMessages');
        return List<Map<String, dynamic>>.from(responseMessages);
      } else {
        return [];
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
