import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

class HuntAndKill implements Algorithm {
  @override
  Grid on(Grid grid) {
    var current = grid.randomCell();

    while (current != null) {
      var unvisitedNeighbors =
          current.neighbors().where((n) => n.links.isEmpty).toList();
      if (unvisitedNeighbors.isNotEmpty) {
        var neigbor = (unvisitedNeighbors..shuffle()).first;
        current.link(neigbor);
        current = neigbor;
      } else {
        current = null;
        for (var cell in grid.eachCell()) {
          var visitedNeighbors =
              cell.neighbors().where((n) => n.links.isNotEmpty).toList();
          if (cell.links.isEmpty && visitedNeighbors.isNotEmpty) {
            current = cell;

            var neighbor = (visitedNeighbors..shuffle()).first;
            current.link(neighbor);

            break;
          }
        }
      }
    }
    return grid;
  }
}
