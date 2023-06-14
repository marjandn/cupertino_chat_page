import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_db_imessage/ui/chat_screen.dart';
import 'package:firebase_db_imessage/ui/model/chat_message.dart';
import 'package:flutter/widgets.dart';

import '../select_user_screen.dart';

class FirebaseDB {
  final DatabaseReference ref = FirebaseDatabase.instance.ref();
  final List<ChatMessage> messages = <ChatMessage>[
    ChatMessage('how are u doing', DateTime.now(), user2),
    ChatMessage('hey', DateTime.now(), user1),
    ChatMessage('call me', DateTime.now(), user2),
    ChatMessage('send that file', DateTime.now(), user2),
    ChatMessage('hi there', DateTime.now(), user1),
  ];
  final String username;

  FirebaseDB(this.username) {
    ref.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value
          case {'time': String time, 'message': String msg, 'username': String username}) {
        print("message => $msg , time=> $time");

        messages.insert(0, ChatMessage(msg, DateTime.parse(time), username));
        messagesListKey.currentState!.insertItem(0);
      }
    });
  }

  saveMessage(String message) async {
    await ref.set({
      'message': message,
      'time': DateTime.now().toString(),
      'username': username,
    });
  }

  List<ChatMessage> getAllMessages() {
    throw UnimplementedError();
  }

  removeAllData() async => await ref.remove().then((value) => debugPrint("All data has removed!"));
}
