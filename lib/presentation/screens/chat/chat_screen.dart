import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

import 'package:yes_no_app/presentation/widgets/Shared/message_field_box.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubbles.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIP.1XAco0cWZwi8qJFZHrF80QHaHa?rs=1&pid=ImgDetMain'),
          ),
        ),
        title: const Text('Zara'),
      ),
      body: _chatWiew(),
    );
  }
}

// para hacer esto del chat wiew es me apoyo en el container que tengo en el body, CTRL + . y pongo extraer widget y arriba le pongo el nombre que quiero + enter y me aparece todo abajo con el nombre cambiado

// aca trabajo el chat wiew del body que tengo mas arriba
class _chatWiew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                //LISTA
                itemCount: chatProvider
                    .messagesList.length, // QUE ME DICE CUANTOS ELEMENTOS TENGO
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubbles(message: message)
                      : MyMessageBubble(
                          message: message,
                        );
                },
              ),
            ),

            //  CAJA DE TEXTO DE MENSAJES
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
