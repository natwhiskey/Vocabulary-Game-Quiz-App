import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/game/page/game_page.dart';
import 'package:vocabulary_game_quiz_app/home_screen/page/home_screen_page.dart';

class CreateUserController extends ChangeNotifier{
 CreateUserController(this.context);

TextEditingController name = TextEditingController();
 BuildContext context;

 goToPlayGame(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GamePage(name: name.text,)),
    );
  }

  backToHome(){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreenPage()),
    );
}
  
}