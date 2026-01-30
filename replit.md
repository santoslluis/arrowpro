# Arrows Puzzle - Flutter Web Game

## Overview
Clone of "Arrows – Puzzle Escape" - a minimalist logic puzzle game where players must clear arrows from a grid by tapping them in the correct order to avoid collisions.

## How to Play
1. Tap an arrow to make it move in the direction it points
2. Arrows move until they exit the grid
3. If an arrow hits another arrow, you lose
4. Clear all arrows without collisions to win the level
5. Progress through 20 levels of increasing difficulty

## Project Structure
```
lib/
├── main.dart              # App entry point with theme management
├── models/
│   ├── arrow.dart         # Arrow data model (direction, position)
│   └── level.dart         # Level data model
├── game/
│   ├── game_controller.dart   # Game logic (movement, collision, win/lose)
│   └── levels_data.dart       # 20 hand-crafted puzzle levels
├── screens/
│   └── game_screen.dart   # Main game UI with overlays
└── widgets/
    ├── arrow_widget.dart  # Individual arrow rendering
    └── game_board.dart    # Grid and arrow positioning
```

## Features
- 20 puzzle levels with progressive difficulty
- Animated arrow movement
- Collision detection
- Win/lose overlays with replay options
- Level selector
- Dark/light theme toggle
- Responsive design for all screen sizes
- Minimalist elegant design

## Development

### Building
```bash
flutter build web --release --base-href "/"
```

### Running
```bash
python serve.py
```

### Dependencies
- Flutter SDK (via Nix)
- Python 3.11 (for serving static files)

## Technical Details
- Framework: Flutter 3.32.0
- Platform: Web
- State Management: Simple controller pattern with streams
- Animation: AnimatedPositioned for smooth arrow movement

## Recent Changes
- January 30, 2026: Built complete Arrows Puzzle game clone
  - Created arrow and level data models
  - Implemented game controller with collision detection
  - Built responsive game board with grid
  - Added animated arrow widgets
  - Created 20 puzzle levels
  - Added win/lose overlays
  - Implemented level selector and theme toggle
