import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/game/controller/game_controller.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePage();
}

class _GamePage extends State<GamePage> {
  GameController? controller;
  List<int> randomIndexes = []; 
  @override
  void initState() {
    controller = GameController(context);
    randomIndexes = List.generate(4, (index) => index);
    randomIndexes.shuffle();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game'),),
      body: Center(
        child: Column(
          children: [
              const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Text('Question',style: TextStyle(fontSize: 34.0),),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Choose the correct Spelling',style: TextStyle(fontSize: 28.0,color: Colors.purpleAccent)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('A');
                    },
                    child: Text('A : ${controller?.quizzes[0].choices[randomIndexes[0]]?? ''}',style: TextStyle(fontSize: 30),),
                    ),
                  SizedBox(height: 15.0,),
                  GestureDetector(
                    onTap: () {
                      print('B');
                    },
                    child: Text('B : ${controller?.quizzes[0].choices[randomIndexes[1]]?? ''}',style: TextStyle(fontSize: 30))),
                  SizedBox(height: 15.0,),
            
                  GestureDetector(
                    onTap: () {
                      print('C');
                    },
                    child: Text('C : ${controller?.quizzes[0].choices[randomIndexes[2]]?? ''}',style: TextStyle(fontSize: 30))),
                  SizedBox(height: 15.0,),
            
                  GestureDetector(
                    onTap: () {
                      print('D');
                    },
                    child: Text('D : ${controller?.quizzes[0].choices[randomIndexes[3]] ?? ''}',style: TextStyle(fontSize: 30))),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber
                  ),
                  onPressed: () {
                   print('gg');
                  },
                  child: const Text('Submit',style: TextStyle(fontSize: 34),),
                ),
              ),
    );
  }
}