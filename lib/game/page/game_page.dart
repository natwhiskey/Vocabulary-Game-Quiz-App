import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/game/controller/game_controller.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameController controller;

  @override
  void initState() {
    super.initState();
    controller = GameController(context,widget.name);
    controller.init();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildChoiceButton(int index, String choice) {
    return GestureDetector(
      onTap: () {
        setState(() {
        controller.handleChoiceSelection(index);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: controller.selectedChoices[index] ? Colors.green : Colors.transparent,
            width: 6.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          '${String.fromCharCode(65 + index)} : $choice',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
         automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                'Question ${controller.question} / ${controller.quizzes.length}',
                style: TextStyle(fontSize: 34.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Choose the correct Spelling', style: TextStyle(fontSize: 28.0, color: Colors.purpleAccent)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 20),
                child: ListView.builder(
                itemCount: controller.quizzes[controller.currentQuestionIndex].choices.length,
                itemBuilder: (context, index) {
                  return _buildChoiceButton(index, controller.quizzes[controller.currentQuestionIndex].choices[index]);
                },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            controller.handleNextButtonPress(context);
            setState(() {});
          },
          child: const Text(
            'Next',
            style: TextStyle(fontSize: 34),
          ),
        ),
      ),
    );
  }
}
