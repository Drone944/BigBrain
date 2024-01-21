import 'package:flutter/material.dart';
import 'package:flutter_test_app/configs/constants.dart';
import 'package:flutter_test_app/utils/methods.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('tile tapped $topic');
        loadSession(context: context, topic: topic);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kCircularBorderRadius),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: [
            Expanded(flex: 2, child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/$topic.png'),
            )),
            Expanded(child: Text(topic)),
          ],
        ),
      ),
    );
  }
}