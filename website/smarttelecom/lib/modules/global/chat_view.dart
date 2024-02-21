import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:smarttelecom/modules/global/re_usable_button.dart';

import 'chat_controller.dart';

class MyChat extends StatelessWidget {
  const MyChat({super.key, required this.chatController});

  final ChatController chatController;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => chatController.scrollToEnd());
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() => Column(
            children: [
              Center(
                child: openSans("Conversa Conmigo", 32, Colors.black),
              ),
              Expanded(
                child: ListView.builder(
                  controller: chatController.scrollController,
                  itemCount: chatController.chat.length,
                  itemBuilder: (context, index) {
                    var message = chatController.chat[index];
                    return ChatMessage(
                      text: message.text,
                      isUser: message.isUser!,
                      image: message.image,
                      buttons: message.buttons,
                      onButtonPressed: (payload) {
                        chatController.messageController.value =
                            TextEditingValue(text: payload);

                        chatController.sendUserMessage();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: chatController.messageFormKey,
                child: TextFormField(
                  controller: chatController.messageController,
                  focusNode: chatController.messageFocusNode,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: 'Escribe tu mensaje',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debes ingresar un mensaje.';
                    }
                    return null; // El mensaje es válido
                  },
                  onFieldSubmitted: (String value) async {
                    if (chatController.messageFormKey.currentState!
                        .validate()) {
                      // Si el formulario es válido, enviar el mensaje
                      await chatController.sendUserMessage();
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (chatController.messageFormKey.currentState!.validate()) {
                    // Si el formulario es válido, enviar el mensaje
                    await chatController.sendUserMessage();
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(241, 248, 254, 1)),
                ),
                child: const Text('Enviar',
                    style: TextStyle(
                      color: Color.fromRGBO(101, 104, 106, 1),
                    )),
              ),
            ],
          )),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final String? image;
  final List<Map<String, String>>? buttons;
  final Function(String)? onButtonPressed;

  const ChatMessage({
    Key? key,
    required this.text,
    required this.isUser,
    this.image,
    this.buttons,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: isUser ? Colors.blue : Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (text.isNotEmpty)
                Text(
                  text,
                  style: TextStyle(
                    color: isUser ? Colors.white : Colors.black,
                    fontWeight: isUser ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              if (image != null && image!.isNotEmpty)
                Image.network(
                  //"http://localhost:80$image",
                  //"images/products/GS301.png",
                  "https://smarttelecomec.com/media/${image}.jpg",
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              if (buttons != null) //
                _buildButtons(buttons!)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(List<Map<String, String>> buttons) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: buttons.map((button) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (onButtonPressed != null) {
                  final payload = button['payload'] ?? '';
                  if (isLink(payload)) {
                    externo(Uri.parse(payload));
                    // Abre el enlace al hacer clic
                  } else {
                    onButtonPressed!(payload);
                  }
                }
              },
              child: Text(button['title'] ?? ''),
            ),
          );
        }).toList(),
      ),
    );
  }

  bool isLink(String word) {
    final RegExp linkRegex = RegExp(r'https?://[^\s]+');
    return linkRegex.hasMatch(word);
  }
}
