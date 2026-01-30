import 'package:flutter/material.dart';
import '../models/arrow.dart';
import '../game/game_controller.dart';
import 'arrow_widget.dart';

class GameBoard extends StatelessWidget {
  final GameController controller;
  final List<Arrow> arrows;

  const GameBoard({
    super.key,
    required this.controller,
    required this.arrows,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth * 0.9;
        final availableHeight = constraints.maxHeight * 0.8;
        
        final cellWidth = availableWidth / controller.cols;
        final cellHeight = availableHeight / controller.rows;
        final cellSize = cellWidth < cellHeight ? cellWidth : cellHeight;
        
        final boardWidth = cellSize * controller.cols;
        final boardHeight = cellSize * controller.rows;

        return Center(
          child: Container(
            width: boardWidth,
            height: boardHeight,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade700
                    : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                _buildGrid(context, cellSize),
                ...arrows.map((arrow) => _buildArrowPositioned(
                  arrow,
                  cellSize,
                  boardHeight,
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context, double cellSize) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomPaint(
      size: Size(cellSize * controller.cols, cellSize * controller.rows),
      painter: GridPainter(
        rows: controller.rows,
        cols: controller.cols,
        cellSize: cellSize,
        lineColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
      ),
    );
  }

  Widget _buildArrowPositioned(Arrow arrow, double cellSize, double boardHeight) {
    final left = arrow.col * cellSize + (cellSize - cellSize * 0.8) / 2;
    final top = arrow.row * cellSize + (cellSize - cellSize * 0.8) / 2;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 80),
      left: left,
      top: top,
      child: ArrowWidget(
        arrow: arrow,
        cellSize: cellSize,
        onTap: controller.canTapArrow(arrow) 
          ? () => controller.tapArrow(arrow)
          : null,
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final int rows;
  final int cols;
  final double cellSize;
  final Color lineColor;

  GridPainter({
    required this.rows,
    required this.cols,
    required this.cellSize,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1;

    for (int i = 1; i < rows; i++) {
      final y = i * cellSize;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (int i = 1; i < cols; i++) {
      final x = i * cellSize;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
