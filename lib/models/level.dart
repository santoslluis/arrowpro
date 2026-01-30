import 'arrow.dart';

class Level {
  final int id;
  final int rows;
  final int cols;
  final List<Arrow> arrows;

  Level({
    required this.id,
    required this.rows,
    required this.cols,
    required this.arrows,
  });

  Level copyWithArrows(List<Arrow> newArrows) {
    return Level(
      id: id,
      rows: rows,
      cols: cols,
      arrows: newArrows,
    );
  }
}
