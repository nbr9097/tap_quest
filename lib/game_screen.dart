import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  int score = 0;
  int timeLeft = 10;
  late Timer _gameTimer;
  late Timer _targetTimer;
  final Random _random = Random();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _showTarget = false;
  Offset _targetPosition = Offset.zero;

  @override
  void initState() {
    super.initState();

    // Setup animation
    _animationController = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );

    _fadeAnimation = Tween(begin: 0.0, end: 0.9).animate(_animationController);

    _startGameTimer();
    _startTargetTimer();
  }

  void _startGameTimer() {
    _gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          _gameTimer.cancel();
          _targetTimer.cancel();
          _navigateToResults();
        }
      });
    });
  }

  void _startTargetTimer() {
    _targetTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _showNewTarget();
    });
  }

  void _showNewTarget() {
    setState(() {
      _showTarget = true;
      _targetPosition = Offset(
        _random.nextDouble() * 300,
        _random.nextDouble() * 500,
      );

      // Start fade animation
      _animationController.reset();
      _animationController.forward().then((_) {
        if (mounted) {
          setState(() {
            _showTarget = false; // Hide target after animation
          });
        }
      });
    });
  }

  void _increaseScore() {
    if (_showTarget) {
      setState(() {
        score += 10;
        _showTarget = false; // Hide target immediately when tapped
        _animationController.stop(); // Stop the animation
      });
    }
  }

  void _navigateToResults() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(finalScore: score)),
    );
  }

  @override
  void dispose() {
    _gameTimer.cancel();
    _targetTimer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game Started',
          style: TextStyle(
            fontSize: 30,
            color: const Color.fromARGB(255, 0, 3, 169),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 156, 192, 222),
      ),
      body: Stack(
        children: [
          // Score and timer
          Positioned(
            top: 20,
            left: 20,
            child: Text('Score: $score', style: TextStyle(fontSize: 20)),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Text('Time: ${timeLeft}s', style: TextStyle(fontSize: 20)),
          ),

          // Animated target
          if (_showTarget)
            Positioned(
              left: _targetPosition.dx,
              top: _targetPosition.dy,
              child: GestureDetector(
                onTap: _increaseScore,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 132, 15, 15),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
