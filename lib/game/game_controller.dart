import 'dart:async';
import '../models/arrow.dart';
import '../models/level.dart';
import 'levels_data.dart';

enum GameState { loading, playing, won, lost }

class GameController {
  int _currentLevelIndex = 0;
  List<Arrow> _arrows = [];
  int _rows = 0;
  int _cols = 0;
  GameState _gameState = GameState.loading;
  Arrow? _movingArrow;
  String _loadingStatus = '';
  
  final StreamController<void> _updateController = StreamController<void>.broadcast();
  Stream<void> get onUpdate => _updateController.stream;

  int get currentLevelNumber => _currentLevelIndex + 1;
  int get totalLevels => LevelsData.totalLevels;
  List<Arrow> get arrows => _arrows.where((a) => !a.isRemoved).toList();
  int get rows => _rows;
  int get cols => _cols;
  GameState get gameState => _gameState;
  Arrow? get movingArrow => _movingArrow;
  String get loadingStatus => _loadingStatus;

  GameController() {
    _loadCurrentLevel();
  }

  Future<void> _loadCurrentLevel() async {
    _gameState = GameState.loading;
    _loadingStatus = 'Generating level ${currentLevelNumber}...';
    _updateController.add(null);
    
    final level = await LevelsData.generateLevel(
      currentLevelNumber,
      onStatus: (status) {
        _loadingStatus = status;
        _updateController.add(null);
      },
    );
    
    _setLevel(level);
  }

  void _setLevel(Level level) {
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
    if (LevelsData.hasLevelCached(currentLevelNumber)) {
      LevelsData.generateLevel(currentLevelNumber).then(_setLevel);
    } else {
      _loadCurrentLevel();
    }
  }

  void nextLevel() {
    if (_currentLevelIndex < totalLevels - 1) {
      _currentLevelIndex++;
      _loadCurrentLevel();
    }
  }

  void goToLevel(int levelNumber) {
    if (levelNumber >= 1 && levelNumber <= totalLevels) {
      _currentLevelIndex = levelNumber - 1;
      _loadCurrentLevel();
    }
  }

  Future<void> regenerateCurrentLevel() async {
    LevelsData.clearLevelCache(currentLevelNumber);
    await _loadCurrentLevel();
  }

  Future<void> regenerateAllLevels() async {
    LevelsData.clearAllCache();
    _currentLevelIndex = 0;
    await _loadCurrentLevel();
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
