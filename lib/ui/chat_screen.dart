import 'package:firebase_db_imessage/styles/app_theme.dart';
import 'package:firebase_db_imessage/ui/widgets/message_widget.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_db/firebase_db.dart';

final messagesListKey = GlobalKey<AnimatedListState>();

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.username});

  final String username;
  late final _db = FirebaseDB(username);
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Column(children: [
          Expanded(
            child: ClipOval(
                child: Image.network('https://avatars.githubusercontent.com/u/25709266?v=4')),
          ),
          Text(
            'Marjan D',
            style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
          )
        ]),
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: '38',
          color: CupertinoColors.activeBlue,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: AnimatedList(
                  reverse: true,
                  key: messagesListKey,
                  initialItemCount: _db.messages.length,
                  itemBuilder: (BuildContext context, int index, Animation<double> animation) {
                    return SlideTransition(
                      position: Tween<Offset>(begin: const Offset(-1, 1), end: const Offset(0, 0))
                          .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 2, end: 1)
                            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
                        child: MessageWidget(
                          isOwn: _db.messages[index].username == username,
                          message: _db.messages[index].message,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      CupertinoIcons.add_circled_solid,
                      size: 30,
                      color: AppColors.iconColor,
                    ),
                    onPressed: () {},
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      CupertinoIcons.videocam_circle_fill,
                      size: 30,
                      color: AppColors.iconColor,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                      child: CupertinoTextField(
                    decoration: BoxDecoration(
                      color: const CupertinoDynamicColor.withBrightness(
                        color: CupertinoColors.white,
                        darkColor: CupertinoColors.black,
                      ),
                      border: Border.all(
                        color: const CupertinoDynamicColor.withBrightness(
                          color: Color(0x33000000),
                          darkColor: Color(0x33FFFFFF),
                        ),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    minLines: 1,
                    maxLines: 3,
                    controller: _messageController,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    placeholder: 'iMessage',
                    suffix: GestureDetector(
                      onTap: () {
                        _db.saveMessage(_messageController.text.trim());
                        _messageController.clear();
                      },
                      child: Icon(
                        CupertinoIcons.arrow_up_circle_fill,
                        size: 30,
                        color: AppColors.iconColor,
                      ),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
