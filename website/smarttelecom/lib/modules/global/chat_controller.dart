import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/data/model/chat.dart';
import 'package:smarttelecom/data/services/remote/chat_service.dart';

class ChatController extends GetxController {
  ChatService chatService = Get.find<ChatService>();

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  FocusNode messageFocusNode = FocusNode();

  RxList<Chat> chat = <Chat>[].obs;

  final messageFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    messageFocusNode.addListener(() {
      if (messageFocusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 300), () => scrollDown());
      }
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    messageFocusNode.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> sendUserMessage() async {
    if (messageController.text.isNotEmpty) {
      var messages = await chatService.sendUserMessage(messageController.text);
      chat.addAll(messages!);
      messageController.clear();
      messageFocusNode.requestFocus();
    }
  }

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void scrollToEnd() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }
}
