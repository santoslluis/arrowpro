import 'package:flutter/material.dart';
import '../models/arrow.dart';

class ArrowWidget extends StatelessWidget {
  final Arrow arrow;
  final VoidCallback? onTap;
  final double cellSize;

  const ArrowWidget({
    super.key,
    required this.arrow,
    required this.cellSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        width: cellSize * 0.8,
        height: cellSize * 0.8,
        decoration: BoxDecoration(
          color: arrow.isMoving 
            ? (isDark ? Colors.purple.shade300 : Colors.purple.shade400)
            : (isDark ? Colors.deepPurple.shade300 : Colors.deepPurple),
          borderRadius: BorderRadius.circular(cellSize * 0.15),
          boxShadow: [
            BoxShadow(
              color: (isDark ? Colors.purple.shade700 : Colors.deepPurple.shade700).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Transform.rotate(
            angle: _getRotationAngle(),
            child: Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: cellSize * 0.5,
            ),
          ),
        ),
      ),
    );
  }

  double _getRotationAngle() {
    switch (arrow.direction) {
      case ArrowDirection.up:
        return 0;
      case ArrowDirection.right:
        return 1.5708;
      case ArrowDirection.down:
        return 3.1416;
      case ArrowDirection.left:
        return -1.5708;
    }
  }
}
