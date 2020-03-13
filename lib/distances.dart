import 'cell.dart';

class Distances {
  Cell root;
  Map<Cell, int> cells;

  Distances(this.root) {
    cells = <Cell, int>{};
    cells[root] = 0;
  }

  int getCellDistance(Cell cell) {
    return cells[cell];
  }

  void setCellDistance(Cell cell, int distance) {
    cells[cell] = distance;
  }

  List<Cell> getCells() => cells.keys;
}
