import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talksy/app_theme.dart';
import 'package:talksy/chat_screen.dart';
import 'package:talksy/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      home: ChatScreen(),
    );
  }
}
