import '../models/level.dart';
import 'level_generator.dart';

class LevelsData {
  static final LevelGenerator _generator = LevelGenerator();
  static List<Level>? _cachedLevels;
  static bool _isGenerating = false;

  static Future<List<Level>> generateAllLevels({
    Function(int current, int total)? onProgress,
  }) async {
    if (_cachedLevels != null) {
      return _cachedLevels!;
    }

    if (_isGenerating) {
      while (_isGenerating) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      return _cachedLevels!;
    }

    _isGenerating = true;
    final levels = <Level>[];
    final progression = LevelGenerator.getDifficultyProgression();

    for (int i = 0; i < progression.length; i++) {
      final config = progression[i];
      onProgress?.call(i + 1, progression.length);
      
      final level = await _generator.generateLevel(
        levelId: i + 1,
        rows: config['rows']!,
        cols: config['cols']!,
        arrowCount: config['arrows']!,
      );
      levels.add(level);
      
      await Future.delayed(const Duration(milliseconds: 10));
    }

    _cachedLevels = levels;
    _isGenerating = false;
    return levels;
  }

  static void clearCache() {
    _cachedLevels = null;
  }

  static bool get hasCachedLevels => _cachedLevels != null;
}
