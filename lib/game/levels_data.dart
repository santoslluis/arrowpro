import '../models/level.dart';
import 'level_generator.dart';

class LevelsData {
  static final LevelGenerator _generator = LevelGenerator();
  static final Map<int, Level> _cachedLevels = {};

  static Future<Level> generateLevel(int levelNumber, {
    Function(String status)? onStatus,
  }) async {
    if (_cachedLevels.containsKey(levelNumber)) {
      return _cachedLevels[levelNumber]!;
    }

    onStatus?.call('Generating level $levelNumber...');
    
    final config = _getDifficultyForLevel(levelNumber);
    
    final level = await _generator.generateLevel(
      levelId: levelNumber,
      rows: config['rows']!,
      cols: config['cols']!,
      arrowCount: config['arrows']!,
    );
    
    _cachedLevels[levelNumber] = level;
    return level;
  }

  static void clearLevelCache(int levelNumber) {
    _cachedLevels.remove(levelNumber);
  }

  static void clearAllCache() {
    _cachedLevels.clear();
  }

  static bool hasLevelCached(int levelNumber) {
    return _cachedLevels.containsKey(levelNumber);
  }

  static Map<String, int> _getDifficultyForLevel(int level) {
    final arrows = level;
    
    int gridSize;
    if (level <= 3) {
      gridSize = 4;
    } else if (level <= 6) {
      gridSize = 5;
    } else if (level <= 10) {
      gridSize = 6;
    } else if (level <= 15) {
      gridSize = 7;
    } else {
      gridSize = 8;
    }
    
    final maxArrows = gridSize * gridSize - 1;
    final actualArrows = arrows > maxArrows ? maxArrows : arrows;
    
    return {
      'rows': gridSize,
      'cols': gridSize,
      'arrows': actualArrows,
    };
  }

  static int get totalLevels => 20;
}
