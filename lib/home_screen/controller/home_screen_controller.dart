import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/game/page/game_page.dart';

class HomeScreenController extends ChangeNotifier {
   HomeScreenController(this.context);

  BuildContext context;

  goToPlayGame(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GamePage()),
    );
  }

}