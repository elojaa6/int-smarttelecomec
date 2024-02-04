import 'package:get/get.dart';
import 'package:smarttelecom/data/services/remote/chat_service.dart';
import 'package:smarttelecom/modules/global/chat_controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());

    Get.lazyPut<ChatService>(() => ChatService());
  }
}
