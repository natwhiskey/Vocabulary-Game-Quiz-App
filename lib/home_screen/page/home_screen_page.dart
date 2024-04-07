import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/home_screen/controller/home_screen_controller.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<HomeScreenPage> {
  HomeScreenController? controller;

  @override
  void initState() {
    controller = HomeScreenController(context);
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
        appBar: AppBar(
          title: Text('Vocabulary Quiz Game'),
          automaticallyImplyLeading: false,
        ),
        body:  Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to My Game',
                  style: TextStyle(fontSize: 36),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 200.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: GestureDetector(
                    onTap: () {
                      controller?.goToPlayGame();
                    },
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      color: Colors.amber[200],
                      child: const Center(
                        child:  Text(
                                    'Play',
                                    style: TextStyle(fontSize: 34),
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),);
  }
}
