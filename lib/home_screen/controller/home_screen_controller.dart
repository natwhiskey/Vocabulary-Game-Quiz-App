import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/create_user/page/create_user_page.dart';

class HomeScreenController extends ChangeNotifier {
   HomeScreenController(this.context);

  BuildContext context;

  goToPlayGame(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CreateUserPage()),
    );
  }

}