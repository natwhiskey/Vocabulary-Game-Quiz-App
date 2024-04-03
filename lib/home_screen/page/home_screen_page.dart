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
      appBar: AppBar(title: Text('Vocabulary Quiz Game')),
      body: const Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Score : 20000',style: TextStyle(fontSize: 44),),
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
                    controller?.goToPlayGame();
                  },
                  child: const Text('Play',style: TextStyle(fontSize: 34),),
                ),
              )
    );
  }
}
