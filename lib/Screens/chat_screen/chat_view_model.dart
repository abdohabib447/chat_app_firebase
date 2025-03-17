import 'package:chat_app/Models/message.dart';
import 'package:chat_app/Models/constant_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier {
  final String email;
  final ScrollController controller = ScrollController();
  final TextEditingController messageController = TextEditingController();
  final CollectionReference messages =
  FirebaseFirestore.instance.collection(kcollectinName);

  List<Message> _messagesList = [];
  List<Message> get messagesList => _messagesList;

  ChatViewModel(this.email) {
    _listenToMessages();
  }

  void _listenToMessages() {
    messages.orderBy(kcreatedAt, descending: true).snapshots().listen((event) {
      _messagesList = event.docs.map((doc) => Message.fromJson(doc)).toList();
      notifyListeners();
    });
  }

  void sendMessage() {
    String text = messageController.text.trim();
    if (text.isEmpty) return;

    messages.add({
      'text': text,
      kcreatedAt: DateTime.now(),
      'id': email,
    });

    messageController.clear();
    controller.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }
}
