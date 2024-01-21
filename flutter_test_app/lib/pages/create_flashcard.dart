import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/word.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/words.dart';
import 'home_page.dart';

class CreateFlashcards extends StatefulWidget {
  const CreateFlashcards({super.key});

  @override
  State<CreateFlashcards> createState() => _CreateFlashcardsState();
}

class _CreateFlashcardsState extends State<CreateFlashcards> {
  final TextEditingController topicController = TextEditingController();
  final TextEditingController frontSideController = TextEditingController();
  final TextEditingController backSideController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Flashcard'),
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontSize: 20
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
                style: TextStyle(color: Colors.white),
                controller: topicController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Topic',
                  hintText: 'Enter here...',
                  labelStyle: TextStyle(
                    color: Colors.cyan,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide()
                  ),
                )
            ),
            const SizedBox(height: 16),
            TextFormField(
                style: TextStyle(color: Colors.white),
                controller: frontSideController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Question',
                  hintText: 'Enter here...',
                  labelStyle: TextStyle(
                    color: Colors.cyan,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide()
                  ),
                )
            ),
            const SizedBox(height: 16),
            TextFormField(
                style: TextStyle(color: Colors.white),
                controller: backSideController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Answer',
                  hintText: 'Enter here...',
                  labelStyle: TextStyle(
                    color: Colors.cyan,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide()
                  ),
                )
            ),
            const SizedBox(height: 25),
            ElevatedButton(onPressed: () {
              if(topicController.text.isNotEmpty && frontSideController.text.isNotEmpty && backSideController.text.isNotEmpty){
                words.add(Word(topic: topicController.text, frontSide: frontSideController.text, backSide: backSideController.text));
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
              }
            },
                child: Text('Save'))
          ]
        ),
      ),
    );
  }
}
