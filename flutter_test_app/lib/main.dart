import 'package:flutter/material.dart';
import 'package:flutter_test_app/notifiers/flashcards_notifier.dart';
import 'package:flutter_test_app/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'configs/themes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FlashcardsNotifier())
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spanish Flashcards',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
