import '../models/arrow.dart';
import '../models/level.dart';

class LevelsData {
  static List<Level> getAllLevels() {
    return [
      _level1(),
      _level2(),
      _level3(),
      _level4(),
      _level5(),
      _level6(),
      _level7(),
      _level8(),
      _level9(),
      _level10(),
      _level11(),
      _level12(),
      _level13(),
      _level14(),
      _level15(),
      _level16(),
      _level17(),
      _level18(),
      _level19(),
      _level20(),
    ];
  }

  // Level 1: Tutorial - single arrow
  // Solution: Tap the arrow
  static Level _level1() {
    return Level(
      id: 1,
      rows: 3,
      cols: 3,
      arrows: [
        Arrow(id: 1, row: 1, col: 1, direction: ArrowDirection.right),
      ],
    );
  }

  // Level 2: Two independent arrows pointing outward
  // Solution: Any order
  static Level _level2() {
    return Level(
      id: 2,
      rows: 3,
      cols: 3,
      arrows: [
        Arrow(id: 1, row: 0, col: 1, direction: ArrowDirection.up),
        Arrow(id: 2, row: 2, col: 1, direction: ArrowDirection.down),
      ],
    );
  }

  // Level 3: First blocking puzzle
  // Arrow B at (1,2) blocks arrow A at (1,0) pointing right
  // Solution: B first (exits right), then A
  static Level _level3() {
    return Level(
      id: 3,
      rows: 3,
      cols: 3,
      arrows: [
        Arrow(id: 1, row: 1, col: 0, direction: ArrowDirection.right), // A - blocked by B
        Arrow(id: 2, row: 1, col: 2, direction: ArrowDirection.right), // B - free to exit
      ],
    );
  }

  // Level 4: Vertical blocking
  // Arrow B at (2,1) blocks arrow A at (0,1) pointing down
  // Solution: B first (exits down), then A
  static Level _level4() {
    return Level(
      id: 4,
      rows: 4,
      cols: 3,
      arrows: [
        Arrow(id: 1, row: 0, col: 1, direction: ArrowDirection.down), // A - blocked by B
        Arrow(id: 2, row: 2, col: 1, direction: ArrowDirection.down), // B - free to exit
      ],
    );
  }

  // Level 5: Three arrows in a chain
  // C blocks B, B blocks A
  // Solution: C, B, A
  static Level _level5() {
    return Level(
      id: 5,
      rows: 3,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 1, col: 0, direction: ArrowDirection.right), // A
        Arrow(id: 2, row: 1, col: 2, direction: ArrowDirection.right), // B
        Arrow(id: 3, row: 1, col: 4, direction: ArrowDirection.right), // C - free
      ],
    );
  }

  // Level 6: L-shape with dependency
  // Arrow at corner must go first
  // Solution: Corner arrow up, then horizontal arrow right
  static Level _level6() {
    return Level(
      id: 6,
      rows: 4,
      cols: 4,
      arrows: [
        Arrow(id: 1, row: 2, col: 1, direction: ArrowDirection.right), // blocked by B
        Arrow(id: 2, row: 2, col: 3, direction: ArrowDirection.right), // B - free
        Arrow(id: 3, row: 0, col: 1, direction: ArrowDirection.up),    // free
      ],
    );
  }

  // Level 7: Cross pattern - 4 arrows pointing outward
  // Solution: Any order (all free)
  static Level _level7() {
    return Level(
      id: 7,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 0, col: 2, direction: ArrowDirection.up),
        Arrow(id: 2, row: 2, col: 0, direction: ArrowDirection.left),
        Arrow(id: 3, row: 2, col: 4, direction: ArrowDirection.right),
        Arrow(id: 4, row: 4, col: 2, direction: ArrowDirection.down),
      ],
    );
  }

  // Level 8: Double chain - two parallel blocked rows
  // Solution: Right arrows first in each row
  static Level _level8() {
    return Level(
      id: 8,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 1, col: 1, direction: ArrowDirection.right),
        Arrow(id: 2, row: 1, col: 3, direction: ArrowDirection.right), // free
        Arrow(id: 3, row: 3, col: 1, direction: ArrowDirection.right),
        Arrow(id: 4, row: 3, col: 3, direction: ArrowDirection.right), // free
      ],
    );
  }

  // Level 9: Mixed directions with blocking
  // Solution: Outer arrows first
  static Level _level9() {
    return Level(
      id: 9,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 0, col: 2, direction: ArrowDirection.up),    // free
        Arrow(id: 2, row: 2, col: 2, direction: ArrowDirection.up),    // blocked by 1
        Arrow(id: 3, row: 4, col: 2, direction: ArrowDirection.down),  // free
        Arrow(id: 4, row: 2, col: 0, direction: ArrowDirection.left),  // free
      ],
    );
  }

  // Level 10: Corner exits with center blocker
  // All corners point out, center must wait
  static Level _level10() {
    return Level(
      id: 10,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 0, col: 0, direction: ArrowDirection.up),
        Arrow(id: 2, row: 0, col: 4, direction: ArrowDirection.right),
        Arrow(id: 3, row: 4, col: 0, direction: ArrowDirection.left),
        Arrow(id: 4, row: 4, col: 4, direction: ArrowDirection.down),
        Arrow(id: 5, row: 2, col: 2, direction: ArrowDirection.right), // blocked until 2 clears
      ],
    );
  }

  // Level 11: Longer chain (4 arrows)
  // Solution: D, C, B, A
  static Level _level11() {
    return Level(
      id: 11,
      rows: 3,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 1, col: 0, direction: ArrowDirection.right), // A
        Arrow(id: 2, row: 1, col: 2, direction: ArrowDirection.right), // B
        Arrow(id: 3, row: 1, col: 4, direction: ArrowDirection.right), // C
        Arrow(id: 4, row: 1, col: 6, direction: ArrowDirection.right), // D - free
      ],
    );
  }

  // Level 12: Two chains crossing
  // Horizontal and vertical chains
  static Level _level12() {
    return Level(
      id: 12,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 2, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 2, col: 4, direction: ArrowDirection.right), // free
        Arrow(id: 3, row: 0, col: 2, direction: ArrowDirection.down),
        Arrow(id: 4, row: 4, col: 2, direction: ArrowDirection.down),  // free
      ],
    );
  }

  // Level 13: Spiral pattern
  // Outer layer clears first
  static Level _level13() {
    return Level(
      id: 13,
      rows: 6,
      cols: 6,
      arrows: [
        Arrow(id: 1, row: 0, col: 2, direction: ArrowDirection.up),    // free
        Arrow(id: 2, row: 2, col: 5, direction: ArrowDirection.right), // free
        Arrow(id: 3, row: 5, col: 3, direction: ArrowDirection.down),  // free
        Arrow(id: 4, row: 3, col: 0, direction: ArrowDirection.left),  // free
        Arrow(id: 5, row: 1, col: 3, direction: ArrowDirection.up),    // blocked by 1
        Arrow(id: 6, row: 3, col: 4, direction: ArrowDirection.right), // blocked by 2
      ],
    );
  }

  // Level 14: Triple vertical chains
  static Level _level14() {
    return Level(
      id: 14,
      rows: 6,
      cols: 6,
      arrows: [
        Arrow(id: 1, row: 0, col: 1, direction: ArrowDirection.down),
        Arrow(id: 2, row: 4, col: 1, direction: ArrowDirection.down),  // free
        Arrow(id: 3, row: 0, col: 3, direction: ArrowDirection.down),
        Arrow(id: 4, row: 4, col: 3, direction: ArrowDirection.down),  // free
        Arrow(id: 5, row: 0, col: 5, direction: ArrowDirection.right), // free
        Arrow(id: 6, row: 5, col: 5, direction: ArrowDirection.down),  // free
      ],
    );
  }

  // Level 15: Complex blocking pattern
  static Level _level15() {
    return Level(
      id: 15,
      rows: 6,
      cols: 6,
      arrows: [
        Arrow(id: 1, row: 1, col: 1, direction: ArrowDirection.right),
        Arrow(id: 2, row: 1, col: 4, direction: ArrowDirection.right), // free
        Arrow(id: 3, row: 3, col: 1, direction: ArrowDirection.down),
        Arrow(id: 4, row: 5, col: 1, direction: ArrowDirection.down),  // free
        Arrow(id: 5, row: 3, col: 4, direction: ArrowDirection.up),
        Arrow(id: 6, row: 0, col: 4, direction: ArrowDirection.up),    // free
      ],
    );
  }

  // Level 16: Dense center with outer escapes
  static Level _level16() {
    return Level(
      id: 16,
      rows: 7,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 0, col: 3, direction: ArrowDirection.up),    // free
        Arrow(id: 2, row: 3, col: 0, direction: ArrowDirection.left),  // free
        Arrow(id: 3, row: 3, col: 6, direction: ArrowDirection.right), // free
        Arrow(id: 4, row: 6, col: 3, direction: ArrowDirection.down),  // free
        Arrow(id: 5, row: 1, col: 3, direction: ArrowDirection.up),    // blocked by 1
        Arrow(id: 6, row: 3, col: 1, direction: ArrowDirection.left),  // blocked by 2
        Arrow(id: 7, row: 3, col: 5, direction: ArrowDirection.right), // blocked by 3
        Arrow(id: 8, row: 5, col: 3, direction: ArrowDirection.down),  // blocked by 4
      ],
    );
  }

  // Level 17: Long chains in multiple directions
  static Level _level17() {
    return Level(
      id: 17,
      rows: 7,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 3, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 3, col: 2, direction: ArrowDirection.right),
        Arrow(id: 3, row: 3, col: 4, direction: ArrowDirection.right),
        Arrow(id: 4, row: 3, col: 6, direction: ArrowDirection.right), // free
        Arrow(id: 5, row: 0, col: 3, direction: ArrowDirection.down),
        Arrow(id: 6, row: 6, col: 3, direction: ArrowDirection.down),  // free
      ],
    );
  }

  // Level 18: Nested squares
  static Level _level18() {
    return Level(
      id: 18,
      rows: 7,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 0, col: 0, direction: ArrowDirection.up),    // free
        Arrow(id: 2, row: 0, col: 6, direction: ArrowDirection.right), // free
        Arrow(id: 3, row: 6, col: 0, direction: ArrowDirection.left),  // free
        Arrow(id: 4, row: 6, col: 6, direction: ArrowDirection.down),  // free
        Arrow(id: 5, row: 2, col: 2, direction: ArrowDirection.up),    // blocked
        Arrow(id: 6, row: 2, col: 4, direction: ArrowDirection.right), // blocked
        Arrow(id: 7, row: 4, col: 2, direction: ArrowDirection.left),  // blocked
        Arrow(id: 8, row: 4, col: 4, direction: ArrowDirection.down),  // blocked
      ],
    );
  }

  // Level 19: Complex web
  static Level _level19() {
    return Level(
      id: 19,
      rows: 7,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 0, col: 1, direction: ArrowDirection.up),    // free
        Arrow(id: 2, row: 0, col: 5, direction: ArrowDirection.up),    // free
        Arrow(id: 3, row: 6, col: 1, direction: ArrowDirection.down),  // free
        Arrow(id: 4, row: 6, col: 5, direction: ArrowDirection.down),  // free
        Arrow(id: 5, row: 2, col: 1, direction: ArrowDirection.up),    // blocked by 1
        Arrow(id: 6, row: 2, col: 5, direction: ArrowDirection.up),    // blocked by 2
        Arrow(id: 7, row: 4, col: 1, direction: ArrowDirection.down),  // blocked by 3
        Arrow(id: 8, row: 4, col: 5, direction: ArrowDirection.down),  // blocked by 4
        Arrow(id: 9, row: 3, col: 0, direction: ArrowDirection.left),  // free
        Arrow(id: 10, row: 3, col: 6, direction: ArrowDirection.right),// free
      ],
    );
  }

  // Level 20: Ultimate challenge - multiple chains
  static Level _level20() {
    return Level(
      id: 20,
      rows: 8,
      cols: 8,
      arrows: [
        Arrow(id: 1, row: 0, col: 0, direction: ArrowDirection.up),    // free
        Arrow(id: 2, row: 0, col: 7, direction: ArrowDirection.right), // free
        Arrow(id: 3, row: 7, col: 0, direction: ArrowDirection.left),  // free
        Arrow(id: 4, row: 7, col: 7, direction: ArrowDirection.down),  // free
        Arrow(id: 5, row: 2, col: 0, direction: ArrowDirection.up),    // blocked by 1
        Arrow(id: 6, row: 0, col: 5, direction: ArrowDirection.right), // blocked by 2
        Arrow(id: 7, row: 7, col: 2, direction: ArrowDirection.left),  // blocked by 3
        Arrow(id: 8, row: 5, col: 7, direction: ArrowDirection.down),  // blocked by 4
        Arrow(id: 9, row: 3, col: 3, direction: ArrowDirection.right),
        Arrow(id: 10, row: 3, col: 5, direction: ArrowDirection.right),
        Arrow(id: 11, row: 3, col: 7, direction: ArrowDirection.right),// free chain
        Arrow(id: 12, row: 4, col: 4, direction: ArrowDirection.down),
      ],
    );
  }
}
