import 'package:firebase_db_imessage/ui/chat_screen.dart';
import 'package:flutter/cupertino.dart';

const user1 = 'Marjan';
const user2 = 'Iman';

enum Pages { personals, channels, groups }

class SelectUserScreen extends StatelessWidget {
  const SelectUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSegmentedControl<Pages>(
          onValueChanged: (value) {},
          groupValue: Pages.personals,
          children: const {
            Pages.personals: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Personals'),
            ),
            Pages.channels: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Channels'),
            ),
            Pages.groups: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Groups'),
            ),
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoListTile(
                onTap: () => Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) => ChatScreen(username: user1))),
                title: const Text(user1),
                leading: ClipOval(
                    child: Image.network('https://avatars.githubusercontent.com/u/25709266?v=4')),
                subtitle: const Text('hey there, how are you??'),
              ),
              CupertinoListTile(
                onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => ChatScreen(username: user2),
                )),
                title: const Text(user2),
                leading: ClipOval(
                    child: Image.network('https://avatars.githubusercontent.com/u/25709266?v=4')),
                subtitle: const Text(
                    'please send me that file with all required description also remember to'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
