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

  static Level _level2() {
    return Level(
      id: 2,
      rows: 3,
      cols: 3,
      arrows: [
        Arrow(id: 1, row: 1, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 1, col: 2, direction: ArrowDirection.right),
      ],
    );
  }

  static Level _level3() {
    return Level(
      id: 3,
      rows: 3,
      cols: 3,
      arrows: [
        Arrow(id: 1, row: 0, col: 1, direction: ArrowDirection.down),
        Arrow(id: 2, row: 2, col: 1, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level4() {
    return Level(
      id: 4,
      rows: 4,
      cols: 4,
      arrows: [
        Arrow(id: 1, row: 1, col: 1, direction: ArrowDirection.right),
        Arrow(id: 2, row: 1, col: 2, direction: ArrowDirection.down),
        Arrow(id: 3, row: 2, col: 2, direction: ArrowDirection.left),
      ],
    );
  }

  static Level _level5() {
    return Level(
      id: 5,
      rows: 4,
      cols: 4,
      arrows: [
        Arrow(id: 1, row: 0, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 0, col: 3, direction: ArrowDirection.down),
        Arrow(id: 3, row: 3, col: 3, direction: ArrowDirection.left),
        Arrow(id: 4, row: 3, col: 0, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level6() {
    return Level(
      id: 6,
      rows: 4,
      cols: 4,
      arrows: [
        Arrow(id: 1, row: 1, col: 1, direction: ArrowDirection.up),
        Arrow(id: 2, row: 1, col: 2, direction: ArrowDirection.right),
        Arrow(id: 3, row: 2, col: 1, direction: ArrowDirection.left),
        Arrow(id: 4, row: 2, col: 2, direction: ArrowDirection.down),
      ],
    );
  }

  static Level _level7() {
    return Level(
      id: 7,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 2, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 2, col: 2, direction: ArrowDirection.up),
        Arrow(id: 3, row: 0, col: 2, direction: ArrowDirection.right),
        Arrow(id: 4, row: 2, col: 4, direction: ArrowDirection.down),
      ],
    );
  }

  static Level _level8() {
    return Level(
      id: 8,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 0, col: 2, direction: ArrowDirection.down),
        Arrow(id: 2, row: 2, col: 0, direction: ArrowDirection.right),
        Arrow(id: 3, row: 2, col: 2, direction: ArrowDirection.left),
        Arrow(id: 4, row: 2, col: 4, direction: ArrowDirection.left),
        Arrow(id: 5, row: 4, col: 2, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level9() {
    return Level(
      id: 9,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 1, col: 1, direction: ArrowDirection.right),
        Arrow(id: 2, row: 1, col: 3, direction: ArrowDirection.down),
        Arrow(id: 3, row: 3, col: 3, direction: ArrowDirection.left),
        Arrow(id: 4, row: 3, col: 1, direction: ArrowDirection.up),
        Arrow(id: 5, row: 2, col: 2, direction: ArrowDirection.right),
      ],
    );
  }

  static Level _level10() {
    return Level(
      id: 10,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 0, col: 0, direction: ArrowDirection.down),
        Arrow(id: 2, row: 0, col: 4, direction: ArrowDirection.down),
        Arrow(id: 3, row: 2, col: 2, direction: ArrowDirection.up),
        Arrow(id: 4, row: 4, col: 0, direction: ArrowDirection.right),
        Arrow(id: 5, row: 4, col: 4, direction: ArrowDirection.left),
      ],
    );
  }

  static Level _level11() {
    return Level(
      id: 11,
      rows: 5,
      cols: 5,
      arrows: [
        Arrow(id: 1, row: 0, col: 1, direction: ArrowDirection.down),
        Arrow(id: 2, row: 0, col: 3, direction: ArrowDirection.down),
        Arrow(id: 3, row: 2, col: 0, direction: ArrowDirection.right),
        Arrow(id: 4, row: 2, col: 2, direction: ArrowDirection.right),
        Arrow(id: 5, row: 2, col: 4, direction: ArrowDirection.left),
        Arrow(id: 6, row: 4, col: 2, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level12() {
    return Level(
      id: 12,
      rows: 6,
      cols: 6,
      arrows: [
        Arrow(id: 1, row: 1, col: 1, direction: ArrowDirection.right),
        Arrow(id: 2, row: 1, col: 4, direction: ArrowDirection.down),
        Arrow(id: 3, row: 4, col: 4, direction: ArrowDirection.left),
        Arrow(id: 4, row: 4, col: 1, direction: ArrowDirection.up),
        Arrow(id: 5, row: 2, col: 2, direction: ArrowDirection.down),
        Arrow(id: 6, row: 3, col: 3, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level13() {
    return Level(
      id: 13,
      rows: 6,
      cols: 6,
      arrows: [
        Arrow(id: 1, row: 0, col: 2, direction: ArrowDirection.right),
        Arrow(id: 2, row: 0, col: 5, direction: ArrowDirection.down),
        Arrow(id: 3, row: 2, col: 0, direction: ArrowDirection.down),
        Arrow(id: 4, row: 2, col: 3, direction: ArrowDirection.left),
        Arrow(id: 5, row: 5, col: 0, direction: ArrowDirection.right),
        Arrow(id: 6, row: 5, col: 3, direction: ArrowDirection.up),
        Arrow(id: 7, row: 3, col: 5, direction: ArrowDirection.left),
      ],
    );
  }

  static Level _level14() {
    return Level(
      id: 14,
      rows: 6,
      cols: 6,
      arrows: [
        Arrow(id: 1, row: 1, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 1, col: 2, direction: ArrowDirection.right),
        Arrow(id: 3, row: 1, col: 4, direction: ArrowDirection.down),
        Arrow(id: 4, row: 3, col: 4, direction: ArrowDirection.left),
        Arrow(id: 5, row: 3, col: 2, direction: ArrowDirection.left),
        Arrow(id: 6, row: 3, col: 0, direction: ArrowDirection.up),
        Arrow(id: 7, row: 2, col: 5, direction: ArrowDirection.down),
      ],
    );
  }

  static Level _level15() {
    return Level(
      id: 15,
      rows: 6,
      cols: 6,
      arrows: [
        Arrow(id: 1, row: 0, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 0, col: 3, direction: ArrowDirection.down),
        Arrow(id: 3, row: 0, col: 5, direction: ArrowDirection.down),
        Arrow(id: 4, row: 3, col: 0, direction: ArrowDirection.right),
        Arrow(id: 5, row: 5, col: 2, direction: ArrowDirection.up),
        Arrow(id: 6, row: 5, col: 5, direction: ArrowDirection.left),
        Arrow(id: 7, row: 2, col: 2, direction: ArrowDirection.down),
        Arrow(id: 8, row: 4, col: 4, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level16() {
    return Level(
      id: 16,
      rows: 7,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 1, col: 1, direction: ArrowDirection.right),
        Arrow(id: 2, row: 1, col: 3, direction: ArrowDirection.down),
        Arrow(id: 3, row: 1, col: 5, direction: ArrowDirection.down),
        Arrow(id: 4, row: 3, col: 1, direction: ArrowDirection.up),
        Arrow(id: 5, row: 3, col: 3, direction: ArrowDirection.right),
        Arrow(id: 6, row: 3, col: 5, direction: ArrowDirection.left),
        Arrow(id: 7, row: 5, col: 1, direction: ArrowDirection.right),
        Arrow(id: 8, row: 5, col: 3, direction: ArrowDirection.up),
        Arrow(id: 9, row: 5, col: 5, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level17() {
    return Level(
      id: 17,
      rows: 7,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 0, col: 3, direction: ArrowDirection.down),
        Arrow(id: 2, row: 2, col: 1, direction: ArrowDirection.right),
        Arrow(id: 3, row: 2, col: 5, direction: ArrowDirection.left),
        Arrow(id: 4, row: 3, col: 0, direction: ArrowDirection.right),
        Arrow(id: 5, row: 3, col: 3, direction: ArrowDirection.up),
        Arrow(id: 6, row: 3, col: 6, direction: ArrowDirection.left),
        Arrow(id: 7, row: 4, col: 1, direction: ArrowDirection.down),
        Arrow(id: 8, row: 4, col: 5, direction: ArrowDirection.down),
        Arrow(id: 9, row: 6, col: 3, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level18() {
    return Level(
      id: 18,
      rows: 7,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 0, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 0, col: 6, direction: ArrowDirection.down),
        Arrow(id: 3, row: 2, col: 2, direction: ArrowDirection.right),
        Arrow(id: 4, row: 2, col: 4, direction: ArrowDirection.down),
        Arrow(id: 5, row: 4, col: 2, direction: ArrowDirection.up),
        Arrow(id: 6, row: 4, col: 4, direction: ArrowDirection.left),
        Arrow(id: 7, row: 6, col: 0, direction: ArrowDirection.up),
        Arrow(id: 8, row: 6, col: 6, direction: ArrowDirection.left),
        Arrow(id: 9, row: 3, col: 3, direction: ArrowDirection.down),
        Arrow(id: 10, row: 1, col: 3, direction: ArrowDirection.left),
      ],
    );
  }

  static Level _level19() {
    return Level(
      id: 19,
      rows: 7,
      cols: 7,
      arrows: [
        Arrow(id: 1, row: 0, col: 1, direction: ArrowDirection.down),
        Arrow(id: 2, row: 0, col: 5, direction: ArrowDirection.down),
        Arrow(id: 3, row: 1, col: 3, direction: ArrowDirection.right),
        Arrow(id: 4, row: 3, col: 0, direction: ArrowDirection.right),
        Arrow(id: 5, row: 3, col: 2, direction: ArrowDirection.up),
        Arrow(id: 6, row: 3, col: 4, direction: ArrowDirection.down),
        Arrow(id: 7, row: 3, col: 6, direction: ArrowDirection.left),
        Arrow(id: 8, row: 5, col: 1, direction: ArrowDirection.right),
        Arrow(id: 9, row: 5, col: 5, direction: ArrowDirection.left),
        Arrow(id: 10, row: 6, col: 3, direction: ArrowDirection.up),
      ],
    );
  }

  static Level _level20() {
    return Level(
      id: 20,
      rows: 8,
      cols: 8,
      arrows: [
        Arrow(id: 1, row: 0, col: 0, direction: ArrowDirection.right),
        Arrow(id: 2, row: 0, col: 4, direction: ArrowDirection.down),
        Arrow(id: 3, row: 0, col: 7, direction: ArrowDirection.down),
        Arrow(id: 4, row: 2, col: 2, direction: ArrowDirection.right),
        Arrow(id: 5, row: 2, col: 5, direction: ArrowDirection.down),
        Arrow(id: 6, row: 4, col: 1, direction: ArrowDirection.up),
        Arrow(id: 7, row: 4, col: 3, direction: ArrowDirection.right),
        Arrow(id: 8, row: 4, col: 6, direction: ArrowDirection.left),
        Arrow(id: 9, row: 6, col: 2, direction: ArrowDirection.right),
        Arrow(id: 10, row: 6, col: 5, direction: ArrowDirection.up),
        Arrow(id: 11, row: 7, col: 0, direction: ArrowDirection.up),
        Arrow(id: 12, row: 7, col: 7, direction: ArrowDirection.left),
      ],
    );
  }
}
