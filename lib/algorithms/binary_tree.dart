import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

class BinaryTree implements Algorithm {
  @override
  Grid on(Grid grid) {
    for (var cell in grid.eachCell()) {
      var neighbors = [];
      if (cell.north != null) {
        neighbors.add(cell.north);
      }
      if (cell.east != null) {
        neighbors.add(cell.east);
      }
      if (neighbors.isNotEmpty) {
        Cell neighbor = (neighbors..shuffle()).first;
        cell.link(neighbor);
      }
    }
    return grid;
  }
}
