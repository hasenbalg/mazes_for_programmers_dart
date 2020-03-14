import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

class Wilson implements Algorithm {
  @override
  Grid on(Grid grid) {
    List<Cell> unvisited;
    unvisited = [];
    for (var cell in grid.eachCell()) {
      unvisited.add(cell);
    }
    var first = (unvisited..shuffle()).first;
    unvisited.remove(first);

    while (unvisited.isNotEmpty) {
      var cell = (unvisited..shuffle()).first;
      var path = [cell];
      while (unvisited.contains(cell)) {
        cell = (cell.neighbors()..shuffle()).first;
        var position = path.indexOf(cell);
        if (position != -1) {
          path = path.take(position + 1).toList();
        } else {
          path.add(cell);
        }
      }
      for (var i = 0; i < path.length - 1; i++) {
        path[i].link(path[i + 1]);
        unvisited.remove(path[i]);
      }
    }
    return grid;
  }
}
