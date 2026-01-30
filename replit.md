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
│   ├── level_generator.dart   # Algorithmic level generation with backtracking
│   └── levels_data.dart       # On-the-fly level generation and caching
├── screens/
│   └── game_screen.dart   # Main game UI with loading screen and overlays
└── widgets/
    ├── arrow_widget.dart  # Individual arrow rendering
    └── game_board.dart    # Grid and arrow positioning
```

## Features
- 20 puzzle levels with progressive difficulty
- On-the-fly level generation (each level generated when you enter it)
- Level N has N arrows (Level 1 = 1 arrow, Level 20 = 20 arrows)
- Backtracking solver validates solvability before presenting level
- Loading indicator during level generation
- Animated arrow movement
- Collision detection
- Win/lose overlays with replay options
- Level selector
- "New Puzzle" button to regenerate current level
- Dark/light theme toggle
- Responsive design for all screen sizes

## Level Generation System
- Levels are generated on-the-fly when entering each level
- Random arrow placement with backtracking validation
- Level N = N arrows (progressive difficulty)
- Grid size scales with arrow count:
  - Levels 1-3: 4x4 grid
  - Levels 4-6: 5x5 grid
  - Levels 7-10: 6x6 grid
  - Levels 11-15: 7x7 grid
  - Levels 16-20: 8x8 grid

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
- Level Generation: Random placement + backtracking solver

## Recent Changes
- January 30, 2026: On-the-fly level generation
  - Levels generated when entering (not all at once)
  - Level N = N arrows
  - Level 20 has 20 arrows on 8x8 grid
- January 30, 2026: Implemented algorithmic level generation
  - LevelGenerator creates random arrow placements
  - PuzzleSolver uses backtracking to validate solvability
- January 30, 2026: Built complete Arrows Puzzle game clone
