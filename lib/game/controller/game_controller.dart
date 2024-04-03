import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/models/quiz_class.dart';

class GameController extends ChangeNotifier {
   GameController(this.context);

  BuildContext context;

  List<Quiz> quizzes = [
  Quiz(
    choices: ['London', 'Paris', 'Berlin','Bangkok'],
    correctIndex: 1, 
  ),
  Quiz(
    choices: ['Venus', 'Jupiter', 'Mars'],
    correctIndex: 1, 
  ),
  Quiz(
    choices: ['Elephant', 'Giraffe', 'Horse'],
    correctIndex: 1, 
  ),
  Quiz(
    choices: ['Hydrogen', 'Helium', 'Oxygen'],
    correctIndex: 0, 
  ),
  Quiz(
    choices: ['-10°C', '0°C', '10°C'],
    correctIndex: 1, 
  ),
];

randomQuiz(List<Quiz> quizzes){
 return quizzes[Random().nextInt(quizzes.length)];

}


}