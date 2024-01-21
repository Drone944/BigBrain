import 'package:flutter/material.dart';
import 'package:flutter_test_app/notifiers/flashcards_notifier.dart';
import 'package:flutter_test_app/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

loadSession({required BuildContext context, required String topic}){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FlashcardsPage()));
  Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: topic);
}