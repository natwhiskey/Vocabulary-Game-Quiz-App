import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/home_screen/page/home_screen_page.dart';

class SummaryController extends ChangeNotifier {
  SummaryController(this.context, this.name, this.score);
  final String name;
  final int score;

  BuildContext context;

  List<User> mockUserList = [
    User('Nat 1', 0),
    User('Nat 2', 10),
    User('Nat 3', 20),
    User('Nat 4', 30),
    User('Nat 5', 40),
  ];

  List<User> leaderBoards = [];

  void init() {
    sortLeaderBoard();
    notifyListeners();
  }

 backToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreenPage()),
    );
  }

  sortLeaderBoard(){
    leaderBoards.addAll(mockUserList); 
    leaderBoards.add(User(name, score)); 
    leaderBoards.sort((a, b) => b.point.compareTo(a.point));
}

}



class User {
  String name;
  int point;

  User(this.name, this.point);
}
