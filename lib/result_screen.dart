import 'package:flutter/material.dart';
import 'game_screen.dart';

class ResultScreen extends StatelessWidget {
  final int finalScore;
  
  const ResultScreen({super.key, required this.finalScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game Over',
          style: TextStyle(
            fontSize: 30,
            color: const Color.fromARGB(255, 0, 3, 169),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 156, 192, 222),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game Completed!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Your Score:',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              '$finalScore',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
              
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              child: Text('Play Again', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Home', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}