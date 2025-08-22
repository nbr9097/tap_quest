import 'package:flutter/material.dart';
import 'package:tap_quest/game_screen.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TapQuest',style: TextStyle(fontSize: 30,color: const Color.fromARGB(255, 0, 3, 169)),),
          backgroundColor: const Color.fromARGB(255, 156, 192, 222),),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [SizedBox(height: 300,),
              Text('Tap the targets as quickly as possible',style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 0, 3, 169))),
              SizedBox(height: 100,),
              ElevatedButton(
                onPressed: () {
                // Navigation to game screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              child: Text('Start Game'),
            )
          ],
        ),
      ),
    );
  }
}
