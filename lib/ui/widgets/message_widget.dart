import 'package:firebase_db_imessage/styles/app_theme.dart';
import 'package:flutter/cupertino.dart';

import 'imessage_chat_bubble.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.isOwn,
    required this.message,
  });

  final bool isOwn;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Align(
            alignment: isOwn ? Alignment.centerRight : Alignment.centerLeft,
            child: CustomPaint(
                painter: IMessageChatBubble(
                  isOwn: isOwn,
                  color: isOwn ? AppColors.sentMessageBgColor : AppColors.receivedMessageBgColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                      color: isOwn ? AppColors.sentMessageColor : AppColors.receivedMessageColor,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class _MessageBodyWidget extends StatelessWidget {
  const _MessageBodyWidget({
    required this.isOwn,
  });

  final bool isOwn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Text(
        'Hey! This i  ',
        style: TextStyle(
          fontSize: 16,
          color: isOwn ? AppColors.sentMessageColor : AppColors.receivedMessageColor,
        ),
      ),
    );
  }
}
