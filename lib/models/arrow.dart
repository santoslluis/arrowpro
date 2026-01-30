enum ArrowDirection { up, down, left, right }

class Arrow {
  final int id;
  int row;
  int col;
  final ArrowDirection direction;
  bool isMoving;
  bool isRemoved;

  Arrow({
    required this.id,
    required this.row,
    required this.col,
    required this.direction,
    this.isMoving = false,
    this.isRemoved = false,
  });

  Arrow copyWith({
    int? id,
    int? row,
    int? col,
    ArrowDirection? direction,
    bool? isMoving,
    bool? isRemoved,
  }) {
    return Arrow(
      id: id ?? this.id,
      row: row ?? this.row,
      col: col ?? this.col,
      direction: direction ?? this.direction,
      isMoving: isMoving ?? this.isMoving,
      isRemoved: isRemoved ?? this.isRemoved,
    );
  }

  int get deltaRow {
    switch (direction) {
      case ArrowDirection.up:
        return -1;
      case ArrowDirection.down:
        return 1;
      case ArrowDirection.left:
      case ArrowDirection.right:
        return 0;
    }
  }

  int get deltaCol {
    switch (direction) {
      case ArrowDirection.left:
        return -1;
      case ArrowDirection.right:
        return 1;
      case ArrowDirection.up:
      case ArrowDirection.down:
        return 0;
    }
  }
}
