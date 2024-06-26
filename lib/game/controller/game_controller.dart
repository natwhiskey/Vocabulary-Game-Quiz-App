import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/models/quiz_class.dart';
import 'package:vocabulary_game_quiz_app/summary/controller/summary_controller.dart';
import 'package:vocabulary_game_quiz_app/summary/page/summary_page.dart';

class GameController extends ChangeNotifier {
  final String name;
   GameController(this.context, this.name);
    int currentQuestionIndex = 0;
    int question = 1;
    int score = 0;
    bool? isCorrect;
    List<bool> selectedChoices = [false, false, false, false];
    String oldChoice = ''; 
    int oldQuestionId = 0;
    List<User> mockUserList = [];

  init(){
    print(score);
    shuffleChoices();
    notifyListeners();
  }

  BuildContext context;

  List<String> answer = ['Result','Mango','Apple', 'Thailand','Banana'];
  
  List<String> userAnswer = [];


  List<Quiz> quizzes = [
  Quiz(
    id: 0,
    choices: ['Resuls', 'Result', 'Resull','Resutt'],
  ),
  Quiz(
    id: 1,
    choices: ['Mango', 'Mungo', 'Mengo','Mingo'],
  ),
  Quiz(
    id: 2,
    choices: ['Appel', 'Appul', 'Apple','Appee'],
  ),
  Quiz(
    id: 3,
    choices: ['Thailan', 'Thalend', 'Thailond','Thailand'],
  ),
  Quiz(
    id: 4,
    choices: ['Banono', 'Banano', 'Banana','Banona'],
  ),
];



  generateNewQuiz() {
   if (currentQuestionIndex < 4) {
        currentQuestionIndex++;
        question++;
        shuffleChoices();

      } else {
        goToSummary();
        checkResult();
        question = 1;
        currentQuestionIndex = 0;
      }
  notifyListeners();
}

goToSummary(){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SummaryPage(score: score,name: name,)),
    );
}

 shuffleChoices() {
    List<String> choices = quizzes[currentQuestionIndex].choices;
    choices.shuffle();
  }

checkResult(){
  for(var i = 0; i < answer.length; i++){
    if(userAnswer[i] == answer[i]){
      score += 10;
    }else{
      score += 0;
    }
  }
}


 handleChoiceSelection(int index) {
  selectedChoices = List.filled(selectedChoices.length, false);
  selectedChoices[index] = true;

  if (selectedChoices[index] != oldChoice && quizzes[currentQuestionIndex].id == oldQuestionId) {
    if (userAnswer.isNotEmpty) {
      userAnswer.removeLast();
    }
    userAnswer.add(quizzes[currentQuestionIndex].choices[index]);
    oldChoice = quizzes[currentQuestionIndex].choices[index];
  } else if (selectedChoices[index] != oldChoice && quizzes[currentQuestionIndex].id != oldQuestionId) {
    userAnswer.add(quizzes[currentQuestionIndex].choices[index]);
    oldChoice = quizzes[currentQuestionIndex].choices[index];
    oldQuestionId = quizzes[currentQuestionIndex].id;
  }
}


 handleNextButtonPress(BuildContext context) {
  int temp = 0;
  for (var i = 0; i < selectedChoices.length; i++) {
    if (selectedChoices[i] == true) {
      generateNewQuiz();
      selectedChoices = List.filled(selectedChoices.length, false);
      break;
    } else {
      temp++;
    }
    if (temp == 4) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Center(child: Text("กรุณา เลือกคำตอบ", style: TextStyle(color: Colors.red))),
            backgroundColor: Colors.white,
          );
        },
      );
    }
  }
}



}