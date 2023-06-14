import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_db_imessage/ui/chat_screen.dart';
import 'package:firebase_db_imessage/ui/select_user_screen.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(title: 'Flutter Demo', home: SelectUserScreen());
  }
}
