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
│   └── levels_data.dart       # Level caching and generation orchestration
├── screens/
│   └── game_screen.dart   # Main game UI with loading screen and overlays
└── widgets/
    ├── arrow_widget.dart  # Individual arrow rendering
    └── game_board.dart    # Grid and arrow positioning
```

## Features
- 20 puzzle levels with progressive difficulty
- Algorithmic level generation (random placement + backtracking validation)
- Loading screen with progress indicator during level generation
- Animated arrow movement
- Collision detection
- Win/lose overlays with replay options
- Level selector
- "New Puzzles" button to regenerate all levels
- Dark/light theme toggle
- Responsive design for all screen sizes
- Minimalist elegant design

## Level Generation System
The game uses an algorithmic approach to generate levels:
1. Random arrow placement on the grid
2. Backtracking solver validates solvability
3. If not solvable, regenerates with new random placement
4. Difficulty progression increases grid size and arrow count

### Difficulty Progression
- Levels 1-5: 3x3 to 4x4 grids, 2-5 arrows
- Levels 6-9: 5x5 grids, 4-7 arrows
- Levels 10-13: 6x6 grids, 5-8 arrows
- Levels 14-16: 7x7 grids, 6-8 arrows
- Levels 17-20: 8x8 grids, 6-9 arrows

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
- January 30, 2026: Implemented algorithmic level generation
  - LevelGenerator creates random arrow placements
  - PuzzleSolver uses backtracking to validate solvability
  - Loading screen shows progress during generation
  - "New Puzzles" button allows regenerating levels
- January 30, 2026: Built complete Arrows Puzzle game clone
  - Created arrow and level data models
  - Implemented game controller with collision detection
  - Built responsive game board with grid
  - Added animated arrow widgets
  - Added win/lose overlays
  - Implemented level selector and theme toggle
