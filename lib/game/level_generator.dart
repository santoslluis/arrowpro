import 'dart:math';
import '../models/arrow.dart';
import '../models/level.dart';

class LevelGenerator {
  final Random _random = Random();

  Future<Level> generateLevel({
    required int levelId,
    required int rows,
    required int cols,
    required int arrowCount,
    int maxAttempts = 100,
  }) async {
    for (int attempt = 0; attempt < maxAttempts; attempt++) {
      final arrows = _generateRandomArrows(rows, cols, arrowCount);
      final level = Level(id: levelId, rows: rows, cols: cols, arrows: arrows);
      
      if (PuzzleSolver.isSolvable(level)) {
        return level;
      }
      
      if (attempt % 10 == 0) {
        await Future.delayed(Duration.zero);
      }
    }
    
    return _generateSimpleLevel(levelId, rows, cols, arrowCount);
  }

  List<Arrow> _generateRandomArrows(int rows, int cols, int count) {
    final arrows = <Arrow>[];
    final usedPositions = <String>{};
    final directions = ArrowDirection.values;
    final totalCells = rows * cols;
    
    if (count > totalCells) {
      count = totalCells;
    }
    
    int id = 1;
    int attempts = 0;
    final maxAttempts = totalCells * 3;
    
    while (arrows.length < count && attempts < maxAttempts) {
      attempts++;
      final row = _random.nextInt(rows);
      final col = _random.nextInt(cols);
      final posKey = '$row,$col';
      
      if (usedPositions.contains(posKey)) continue;
      
      final direction = directions[_random.nextInt(directions.length)];
      
      arrows.add(Arrow(id: id++, row: row, col: col, direction: direction));
      usedPositions.add(posKey);
    }
    
    return arrows;
  }

  Level _generateSimpleLevel(int levelId, int rows, int cols, int arrowCount) {
    final arrows = <Arrow>[];
    final usedPositions = <String>{};
    int id = 1;
    
    final edgeArrows = <Arrow>[];
    if (rows > 0) edgeArrows.add(Arrow(id: 0, row: 0, col: cols ~/ 2, direction: ArrowDirection.up));
    if (rows > 1) edgeArrows.add(Arrow(id: 0, row: rows - 1, col: cols ~/ 2, direction: ArrowDirection.down));
    if (cols > 0) edgeArrows.add(Arrow(id: 0, row: rows ~/ 2, col: 0, direction: ArrowDirection.left));
    if (cols > 1) edgeArrows.add(Arrow(id: 0, row: rows ~/ 2, col: cols - 1, direction: ArrowDirection.right));
    
    for (int i = 0; i < arrowCount && i < edgeArrows.length; i++) {
      final a = edgeArrows[i];
      final posKey = '${a.row},${a.col}';
      if (!usedPositions.contains(posKey)) {
        arrows.add(Arrow(id: id++, row: a.row, col: a.col, direction: a.direction));
        usedPositions.add(posKey);
      }
    }
    
    for (int row = 0; row < rows && arrows.length < arrowCount; row++) {
      for (int col = 0; col < cols && arrows.length < arrowCount; col++) {
        final posKey = '$row,$col';
        if (!usedPositions.contains(posKey)) {
          ArrowDirection dir;
          if (row == 0) dir = ArrowDirection.up;
          else if (row == rows - 1) dir = ArrowDirection.down;
          else if (col == 0) dir = ArrowDirection.left;
          else dir = ArrowDirection.right;
          
          arrows.add(Arrow(id: id++, row: row, col: col, direction: dir));
          usedPositions.add(posKey);
        }
      }
    }
    
    return Level(id: levelId, rows: rows, cols: cols, arrows: arrows);
  }

  static List<Map<String, int>> getDifficultyProgression() {
    return [
      {'rows': 3, 'cols': 3, 'arrows': 2},
      {'rows': 3, 'cols': 3, 'arrows': 3},
      {'rows': 4, 'cols': 4, 'arrows': 3},
      {'rows': 4, 'cols': 4, 'arrows': 4},
      {'rows': 4, 'cols': 4, 'arrows': 5},
      {'rows': 5, 'cols': 5, 'arrows': 4},
      {'rows': 5, 'cols': 5, 'arrows': 5},
      {'rows': 5, 'cols': 5, 'arrows': 6},
      {'rows': 5, 'cols': 5, 'arrows': 7},
      {'rows': 6, 'cols': 6, 'arrows': 5},
      {'rows': 6, 'cols': 6, 'arrows': 6},
      {'rows': 6, 'cols': 6, 'arrows': 7},
      {'rows': 6, 'cols': 6, 'arrows': 8},
      {'rows': 7, 'cols': 7, 'arrows': 6},
      {'rows': 7, 'cols': 7, 'arrows': 7},
      {'rows': 7, 'cols': 7, 'arrows': 8},
      {'rows': 8, 'cols': 8, 'arrows': 6},
      {'rows': 8, 'cols': 8, 'arrows': 7},
      {'rows': 8, 'cols': 8, 'arrows': 8},
      {'rows': 8, 'cols': 8, 'arrows': 9},
    ];
  }
}

class PuzzleSolver {
  static bool isSolvable(Level level) {
    final arrowStates = level.arrows.map((a) => _ArrowState.from(a)).toList();
    return _solve(arrowStates, level.rows, level.cols);
  }

  static bool _solve(List<_ArrowState> arrows, int rows, int cols) {
    final remaining = arrows.where((a) => !a.removed).toList();
    
    if (remaining.isEmpty) return true;
    
    for (final arrow in remaining) {
      if (_canMove(arrow, remaining, rows, cols)) {
        arrow.removed = true;
        
        if (_solve(arrows, rows, cols)) {
          return true;
        }
        
        arrow.removed = false;
      }
    }
    
    return false;
  }

  static bool _canMove(_ArrowState arrow, List<_ArrowState> allArrows, int rows, int cols) {
    int row = arrow.row;
    int col = arrow.col;
    int dRow = 0, dCol = 0;
    
    switch (arrow.direction) {
      case ArrowDirection.up:
        dRow = -1;
        break;
      case ArrowDirection.down:
        dRow = 1;
        break;
      case ArrowDirection.left:
        dCol = -1;
        break;
      case ArrowDirection.right:
        dCol = 1;
        break;
    }
    
    row += dRow;
    col += dCol;
    
    while (row >= 0 && row < rows && col >= 0 && col < cols) {
      for (final other in allArrows) {
        if (!other.removed && other.row == row && other.col == col) {
          return false;
        }
      }
      row += dRow;
      col += dCol;
    }
    
    return true;
  }
}

class _ArrowState {
  final int id;
  final int row;
  final int col;
  final ArrowDirection direction;
  bool removed;

  _ArrowState({
    required this.id,
    required this.row,
    required this.col,
    required this.direction,
    this.removed = false,
  });

  factory _ArrowState.from(Arrow arrow) {
    return _ArrowState(
      id: arrow.id,
      row: arrow.row,
      col: arrow.col,
      direction: arrow.direction,
    );
  }
}
