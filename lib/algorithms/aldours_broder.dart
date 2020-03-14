import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

class AldoursBroder implements Algorithm {
  @override
  Grid on(Grid grid) {
    var cell = grid.randomCell();
    var unvisited = grid.size() - 1;
    while (unvisited > 0) {
      var neighbor = (cell.neighbors()..shuffle()).first;
      if (neighbor.links.isEmpty) {
        cell.link(neighbor);
        unvisited -= 1;
      }
      cell = neighbor;
    }
    return grid;
  }
}
