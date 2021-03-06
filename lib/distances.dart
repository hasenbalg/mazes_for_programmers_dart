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

  Distances pathTo(Cell goal) {
    var current = goal;
    var breadcumbs = Distances(root);
    breadcumbs.setCellDistance(current, cells[current]);

    while (current != root) {
      for (var neighbor in current.getLinkedCells()) {
        if (cells[neighbor] < cells[current]) {
          breadcumbs.setCellDistance(neighbor, cells[neighbor]);
          current = neighbor;
          break;
        }
      }
    }
    return breadcumbs;
  }

  Map<Cell, int> max() {
    var maxDistance = 0;
    var maxCell = root;

    for (var cell in cells.keys) {
      // if cell distance > maxDistance
      if (cells[cell] > maxDistance) {
        maxCell = cell;
        maxDistance = cells[cell];
      }
    }
    return {maxCell: maxDistance};
  }
}
