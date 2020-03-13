import 'package:mazes_for_programmers_dart/distances.dart';

import 'grid.dart';

class DistanceGrid extends Grid {
  Distances distances;
  DistanceGrid(int rows, int cols) : super(rows, cols);
  @override
  String contentsOf(Cell cell) {
    if (distances != null && distances.getCellDistance(cell) != null) {
      return distances.getCellDistance(cell).toString();
    }
    return super.contentsOf(cell);
  }
}
