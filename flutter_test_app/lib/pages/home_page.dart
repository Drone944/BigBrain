import 'package:flutter/material.dart';
import 'package:flutter_test_app/pages/create_flashcard.dart';

import '../components/home_page/topic_tile.dart';
import '../data/words.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> _topics = [];

  @override
  void initState() {
    for(var t in words){
      if(!_topics.contains(t.topic)){
        _topics.add(t.topic);
      }
      _topics.sort();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        toolbarHeight: size.height * 0.15,
        title: Text('BIG BRAIN'),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.10),
                  child: Image.asset('assets/images/bigbrain.jpg'),
                ),
              ),
            ),
            SliverGrid(delegate: SliverChildBuilderDelegate(
              childCount: _topics.length,
                (context, index) => TopicTile(topic: _topics[index]),
            ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ))
          ],
        ),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CreateFlashcards()),);
              },
            ),
          ),
          // Container(
          //   margin: EdgeInsets.all(10),
          //   child: FloatingActionButton(
          //     child: Icon(Icons.delete),
          //     backgroundColor: Colors.white,
          //     onPressed: () {},
          //   ),
          // )
        ],
      ),
    );
  }
}

