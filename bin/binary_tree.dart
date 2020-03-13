import 'dart:math';

import 'grid.dart';

class BinaryTree {
  Grid on(Grid grid) {
    for (Cell cell in grid.eachCell()) {
      List<Cell> neighbors = [];
      if (cell.north != null) {
        neighbors.add(cell.north);
      }
      if (cell.east != null) {
        neighbors.add(cell.east);
      }
      if (neighbors.isNotEmpty) {
        Random rnd = Random();
        var index = rnd.nextInt(neighbors.length);
        Cell neighbor = neighbors[index];
        cell.link(neighbor);
      }
    }
    return grid;
  }
}
