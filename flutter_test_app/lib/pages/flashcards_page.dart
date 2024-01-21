import 'package:flutter/material.dart';
import 'package:flutter_test_app/animations/slide_animation.dart';
import 'package:flutter_test_app/enums/slide_direction.dart';
import 'package:flutter_test_app/notifiers/flashcards_notifier.dart';
import 'package:flutter_test_app/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../animations/half_flip_animation.dart';
import '../components/flashcards_page/card_1.dart';
import '../components/flashcards_page/card_2.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final flashcardsNotifier = Provider.of<FlashcardsNotifier>(context, listen: false);
      flashcardsNotifier.runSlideCard1();
      flashcardsNotifier.generateAllSelectedWords();
      flashcardsNotifier.generateCurrentWord();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: AppBar(
          leading:
            IconButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
            }, icon: Icon(Icons.arrow_back_ios_new)),
          title: Text(notifier.topic),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: IgnorePointer(
          ignoring: notifier.ignoreTouches,
          child: Stack(
            children: [
              Card2(),
              Card1(),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
