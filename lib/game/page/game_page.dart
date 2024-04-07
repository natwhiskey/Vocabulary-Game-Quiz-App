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
          controller.selectedChoices = List.filled(controller.selectedChoices.length, false);
          controller.selectedChoices[index] = true;

          if (controller.selectedChoices[index] != controller.oldChoice && controller.quizzes[controller.currentQuestionIndex].id == controller.oldQuestionId) {
            if (controller.userAnswer.isNotEmpty) {
              controller.userAnswer.removeLast();
            }
            print('1');
            controller.userAnswer.add(controller.quizzes[controller.currentQuestionIndex].choices[index]);
            controller.oldChoice = controller.quizzes[controller.currentQuestionIndex].choices[index];
          } else if (controller.selectedChoices[index] != controller.oldChoice && controller.quizzes[controller.currentQuestionIndex].id != controller.oldQuestionId) {
            print('2');
            controller.userAnswer.add(controller.quizzes[controller.currentQuestionIndex].choices[index]);
            controller.oldChoice = controller.quizzes[controller.currentQuestionIndex].choices[index];
            controller.oldQuestionId = controller.quizzes[controller.currentQuestionIndex].id;
          }
                // print(controller.userAnswer);
                //         print('OLD : ${controller.oldQuestionId}');
                //         print('OLD Choice ${controller.oldChoice}');
                //         print('OLD Question ${controller.oldQuestionId}');
                //         print('NEW :${controller.quizzes[controller.currentQuestionIndex].id}');
                //         print('${controller.selectedChoices}');
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
                'Question ${controller.question}',
                style: TextStyle(fontSize: 34.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Choose the correct Spelling', style: TextStyle(fontSize: 28.0, color: Colors.purpleAccent)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Column(
                children: [
                  for (int i = 0; i < controller.quizzes[controller.currentQuestionIndex].choices.length; i++)
                    Column(
                      children: [
                        _buildChoiceButton(i, controller.quizzes[controller.currentQuestionIndex].choices[i]),
                        SizedBox(height: 15.0),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          onPressed: () {
            int temp = 0;
            for (var i = 0; i < controller.selectedChoices.length; i++) {
              if(controller.selectedChoices[i] == true){
            controller.generateNewQuiz();
            controller.selectedChoices = List.filled(controller.selectedChoices.length, false);
                 
                  break;
              }else{
                temp++;
              }if (temp == 4) {
                print(temp);
                 showDialog(
                   context: context,
                   builder: (BuildContext context) {
                return alert;
                   },
                   );
              
              }
            }
            setState(() {});
          },
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 34),
          ),
        ),
      ),
    );
  }
   Widget alert = const AlertDialog(
    title: Center(child: Text("กรุณา เลือกคำตอบ",style: TextStyle(color: Colors.red),)),
    backgroundColor: Colors.white,
   );
}
