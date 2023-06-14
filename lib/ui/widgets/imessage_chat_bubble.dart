import 'package:flutter/cupertino.dart';

class IMessageChatBubble extends CustomPainter {
  IMessageChatBubble({required this.color, required this.isOwn});

  final Color color;
  final bool isOwn;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    Path paintBubbleTail() {
      Path path;
      if (!isOwn) {
        path = Path()
          ..moveTo(8, size.height - 8)
          ..quadraticBezierTo(-2, size.height, -16, size.height - 9)
          ..quadraticBezierTo(-8, size.height - 8, 0, size.height - 22);
      } else {
        path = Path()
          ..moveTo(size.width - 11, size.height - 9)
          ..quadraticBezierTo(size.width + 2, size.height, size.width + 16, size.height - 9)
          ..quadraticBezierTo(size.width + 8, size.height - 8, size.width - 1, size.height - 22);
      }
      return path;
    }

    final RRect bubbleBody = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(24));
    final Path bubbleTail = paintBubbleTail();

    canvas.drawRRect(bubbleBody, paint);
    canvas.drawPath(bubbleTail, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
