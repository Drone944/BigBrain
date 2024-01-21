import 'dart:math';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/configs/constants.dart';
import 'package:provider/provider.dart';

import '../../animations/half_flip_animation.dart';
import '../../animations/slide_animation.dart';
import '../../enums/slide_direction.dart';
import '../../notifiers/flashcards_notifier.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder: (_,notifier,__) => GestureDetector(
        onHorizontalDragEnd: (details){
          if(details.primaryVelocity! > 100){
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
          if(details.primaryVelocity! < -100){
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: (){
            notifier.setIgnoreTouch(ignore: false);
          },
          child: SlideAnimation(
            animationCompleted: (){
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            direction: notifier.swipedDirection,
            child: Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.8,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 255, 255),
                  borderRadius: BorderRadius.circular(kCircularBorderRadius),
                  border: Border.all(
                    color: Colors.white,
                    width: kCardBorderWidth,
                  )
                ),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TeXView(
                          child: TeXViewDocument(notifier.word2.backSide,
                          style: TeXViewStyle.fromCSS("text-align:center; font-size:30px"))
                          ),
                      ]
                    ),
                    )
                ),
              ),
            ),
          ),
        ),
      );
  }
}