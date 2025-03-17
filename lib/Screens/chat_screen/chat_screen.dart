import 'package:chat_app/Models/constant_data.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_friend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_view_model.dart';

class ChatView extends StatelessWidget {
  static String routeName = 'ChatScreen';

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(email),
      child: Consumer<ChatViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kprimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/chat.png',
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Chaty',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: viewModel.messagesList.isEmpty
                      ? const Center(child: Text('No messages yet.'))
                      : ListView.builder(
                    reverse: true,
                    controller: viewModel.controller,
                    itemCount: viewModel.messagesList.length,
                    itemBuilder: (context, index) {
                      final message = viewModel.messagesList[index];
                      return message.id == email
                          ? ChatBubble(
                        message: message,
                        color: kprimaryColor,
                      )
                          : ChatBubbleFriend(
                        color: const Color(0xff006388),
                        message: message,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: TextField(
                    controller: viewModel.messageController,
                    onSubmitted: (value) => viewModel.sendMessage(),
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        color: kprimaryColor,
                        onPressed: viewModel.sendMessage,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kprimaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
