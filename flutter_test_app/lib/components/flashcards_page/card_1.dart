import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:provider/provider.dart';

import '../../animations/half_flip_animation.dart';
import '../../animations/slide_animation.dart';
import '../../configs/constants.dart';
import '../../enums/slide_direction.dart';
import '../../notifiers/flashcards_notifier.dart';

class Card1 extends StatelessWidget {
  const Card1({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder: (_,notifier,__) => GestureDetector(
        onTap: (){
          notifier.runFlipCard1();
          notifier.setIgnoreTouch(ignore: true);
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfWay: false,
          animationCompleted: (){
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            animationCompleted: (){
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1,
            direction: SlideDirection.upIn,
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
                child: Padding(
                  padding: EdgeInsets.all(9),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TeXView(
                            child: TeXViewDocument(notifier.word1.frontSide,
                                style: TeXViewStyle.fromCSS("text-align:center; font-size:45px"))
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
