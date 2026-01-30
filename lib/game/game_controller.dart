import 'dart:async';
import '../models/arrow.dart';
import '../models/level.dart';
import 'levels_data.dart';

enum GameState { playing, won, lost }

class GameController {
  final List<Level> _allLevels = LevelsData.getAllLevels();
  int _currentLevelIndex = 0;
  late List<Arrow> _arrows;
  late int _rows;
  late int _cols;
  GameState _gameState = GameState.playing;
  Arrow? _movingArrow;
  
  final StreamController<void> _updateController = StreamController<void>.broadcast();
  Stream<void> get onUpdate => _updateController.stream;

  int get currentLevelNumber => _currentLevelIndex + 1;
  int get totalLevels => _allLevels.length;
  List<Arrow> get arrows => _arrows.where((a) => !a.isRemoved).toList();
  int get rows => _rows;
  int get cols => _cols;
  GameState get gameState => _gameState;
  Arrow? get movingArrow => _movingArrow;

  GameController() {
    _loadLevel(_currentLevelIndex);
  }

  void _loadLevel(int index) {
    final level = _allLevels[index];
    _rows = level.rows;
    _cols = level.cols;
    _arrows = level.arrows.map((a) => Arrow(
      id: a.id,
      row: a.row,
      col: a.col,
      direction: a.direction,
    )).toList();
    _gameState = GameState.playing;
    _movingArrow = null;
    _updateController.add(null);
  }

  void restartLevel() {
    _loadLevel(_currentLevelIndex);
  }

  void nextLevel() {
    if (_currentLevelIndex < _allLevels.length - 1) {
      _currentLevelIndex++;
      _loadLevel(_currentLevelIndex);
    }
  }

  void goToLevel(int levelNumber) {
    if (levelNumber >= 1 && levelNumber <= _allLevels.length) {
      _currentLevelIndex = levelNumber - 1;
      _loadLevel(_currentLevelIndex);
    }
  }

  bool canTapArrow(Arrow arrow) {
    return _gameState == GameState.playing && _movingArrow == null && !arrow.isMoving;
  }

  Future<void> tapArrow(Arrow arrow) async {
    if (!canTapArrow(arrow)) return;

    final arrowIndex = _arrows.indexWhere((a) => a.id == arrow.id);
    if (arrowIndex == -1) return;

    _movingArrow = _arrows[arrowIndex];
    _arrows[arrowIndex] = _arrows[arrowIndex].copyWith(isMoving: true);
    _updateController.add(null);

    await _moveArrow(arrowIndex);
  }

  Future<void> _moveArrow(int arrowIndex) async {
    final arrow = _arrows[arrowIndex];
    final deltaRow = arrow.deltaRow;
    final deltaCol = arrow.deltaCol;
    final movingArrowId = arrow.id;

    while (_gameState == GameState.playing) {
      final newRow = _arrows[arrowIndex].row + deltaRow;
      final newCol = _arrows[arrowIndex].col + deltaCol;

      if (_isOutOfBounds(newRow, newCol)) {
        _arrows[arrowIndex] = _arrows[arrowIndex].copyWith(isRemoved: true, isMoving: false);
        _movingArrow = null;
        _updateController.add(null);
        _checkWin();
        return;
      }

      final collidingArrow = _getArrowAt(newRow, newCol, excludeId: movingArrowId);
      if (collidingArrow != null) {
        _gameState = GameState.lost;
        _arrows[arrowIndex] = _arrows[arrowIndex].copyWith(isMoving: false);
        _movingArrow = null;
        _updateController.add(null);
        return;
      }

      _arrows[arrowIndex] = _arrows[arrowIndex].copyWith(row: newRow, col: newCol);
      _updateController.add(null);

      await Future.delayed(const Duration(milliseconds: 80));
    }
    
    _arrows[arrowIndex] = _arrows[arrowIndex].copyWith(isMoving: false);
    _movingArrow = null;
  }

  bool _isOutOfBounds(int row, int col) {
    return row < 0 || row >= _rows || col < 0 || col >= _cols;
  }

  Arrow? _getArrowAt(int row, int col, {int? excludeId}) {
    try {
      return _arrows.firstWhere(
        (a) => a.row == row && a.col == col && !a.isRemoved && a.id != excludeId,
      );
    } catch (e) {
      return null;
    }
  }

  void _checkWin() {
    final remainingArrows = _arrows.where((a) => !a.isRemoved).toList();
    if (remainingArrows.isEmpty) {
      _gameState = GameState.won;
      _updateController.add(null);
    }
  }

  void dispose() {
    _updateController.close();
  }
}
