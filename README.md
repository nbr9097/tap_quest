# TapQuest

A fast-paced tapping game built with Flutter where players test their reflexes by tapping targets that appear randomly on the screen.

## 🎮 Concept

TapQuest is a tap-based reaction game where circular targets appear on the screen at random positions, and the player must tap them as quickly as possible to score points. The game features a 10-second time limit, creating an exciting challenge to achieve the highest score possible.

## ✨ Features

- Simple & Intuitive Gameplay: Tap targets before they disappear
- Time Challenge: 10-second countdown timer
- Score Tracking: Real-time score display with +10 points per successful tap
- Smooth Animations: Fade-in effect for targets using Flutter's animation system
- Responsive UI: Clean interface with consistent color scheme
- Game Flow: Complete game cycle with start screen, gameplay, and results

## 🛠️ Technical Implementation 

###Key Flutter Features Used
- GestureDetector: Detects taps on the target objects
- Stack: Positions tapable objects over the background
-Timer (from dart:async): Controls target appearance and game countdown
- setState: Updates the score and refreshes the game UI
- Random (from dart:math): Randomizes target positions
- AnimationController: Creates smooth fade animations for targets

  ## Project Structure

  lib/
-  main.dart          - App entry point
-  start_screen.dart  - Welcome and instructions screen
-  game_screen.dart   - Main gameplay logic
-  result_screen.dart - Score display and replay options

## Project Screen shots
- Home Screen
- <img width="200" height="500" alt="Screenshot 2025-08-22 122217" src="https://github.com/user-attachments/assets/3b5d4250-c0ce-495b-8a38-7cc54582afb7" />   
- Game Screen
- <img width="200" height="500" alt="Screenshot 2025-08-22 122303" src="https://github.com/user-attachments/assets/150518ba-6732-4ec8-b888-1dc44361b416" />
- Result Screen
- <img width="200" height="500" alt="Screenshot 2025-08-22 122311" src="https://github.com/user-attachments/assets/fb7ef61c-5c3d-4635-9b0c-92d95fd91e03" />

