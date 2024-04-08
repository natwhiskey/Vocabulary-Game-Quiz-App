import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/summary/controller/summary_controller.dart';

class SummaryPage extends StatefulWidget {
  final String name;
  final int score;

  const SummaryPage({Key? key, required this.score, required this.name})
      : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  SummaryController? controller;

  @override
  void initState() {
    controller = SummaryController(context, widget.name, widget.score);
    controller?.init();
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
        title: Text('Summary'),
         automaticallyImplyLeading: false,

      ),
      body: Column(
        children: [
         const Center(
            child: Text(
              'Leaderboard',
              style: TextStyle(fontSize: 44),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller?.leaderBoards.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    controller?.leaderBoards[index].name ?? '',
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    'Point: ${controller?.leaderBoards[index].point}',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            controller?.backToHome();
          },
          child: Text(
                'Play again',
                style: TextStyle(fontSize: 34),
              ),
        ),
      ),
    );
  }
}
