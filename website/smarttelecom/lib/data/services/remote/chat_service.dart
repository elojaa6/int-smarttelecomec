import 'package:get/get.dart';
import 'package:smarttelecom/data/model/chat.dart';
import 'package:smarttelecom/data/services/remote/api/api.dart';

class ChatService extends GetxService {
  Future<List<Chat>?> sendUserMessage(String message, String userId) async {
    try {
      var messages = await TelecomApi.sendMessageToRasa(message, userId);
      return (messages).map((e) => Chat.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
