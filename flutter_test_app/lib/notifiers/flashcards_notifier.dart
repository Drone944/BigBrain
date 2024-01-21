import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/configs/constants.dart';
import 'package:flutter_test_app/enums/slide_direction.dart';

import '../data/words.dart';
import '../models/word.dart';

class FlashcardsNotifier extends ChangeNotifier {
  String topic = '';
  Word word1 = Word(topic:"", frontSide:"", backSide:"");
  Word word2 = Word(topic:"", frontSide:"", backSide:"");
  List<Word> selectedWords = [];

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  generateAllSelectedWords(){
    selectedWords.clear();
    selectedWords = words.where((element) => element.topic == topic).toList();
  }

  generateCurrentWord(){
    if(selectedWords.isNotEmpty) {
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    }else{
      print("All words empty");
    }
    
    Future.delayed(const Duration(milliseconds: kSlideAwayDuration),(){
      word2 = word1;
    });
  }

  

  ///Animation Code :
  bool ignoreTouches = true;

  setIgnoreTouch({required bool ignore}){
    ignoreTouches = ignore;
    notifyListeners();
  }

  SlideDirection swipedDirection = SlideDirection.none;

  bool flipCard1 = false;
  bool flipCard2 = false;
  bool swipeCard2 = false;
  bool slideCard1 = false;
  bool resetSlideCard1 = false;
  bool resetFlipCard1 = false;
  bool resetFlipCard2 = false;
  bool resetSwipeCard2 = false;


  runSlideCard1(){
    resetSlideCard1 = false;
    slideCard1 = true;
    notifyListeners();
  }

  runFlipCard1(){
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  resetCard1(){
    resetFlipCard1 = true;
    resetSlideCard1 = true;
    slideCard1 = false;
    flipCard1 = false;
  }

  runFlipCard2(){
    resetFlipCard2 = false;
    flipCard2 = true;
    notifyListeners();
  }


  runSwipeCard2({required SlideDirection direction}){
    swipedDirection = direction;
    resetSwipeCard2 = false;
    swipeCard2 = true;
    notifyListeners();
  }

  resetCard2(){
    resetFlipCard2 = true;
    resetSwipeCard2 = true;
    flipCard2 = false;
    swipeCard2 = false;
  }

}