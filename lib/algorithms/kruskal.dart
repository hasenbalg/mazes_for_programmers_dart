import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

class Kruskal implements Algorithm {
  @override
  Grid on(Grid grid) {
    var listOfWalls = [];
    for (var cell in grid.eachCell()) {
      if (cell.north != null) {
        if (!listOfWalls.contains(<Cell, Cell>{cell.north: cell})) {
          listOfWalls.add(<Cell, Cell>{cell: cell.north});
        }
      }

      if (cell.south != null) {
        if (!listOfWalls.contains(<Cell, Cell>{cell.south: cell})) {
          listOfWalls.add(<Cell, Cell>{cell: cell.south});
        }
      }

      if (cell.east != null) {
        if (!listOfWalls.contains(<Cell, Cell>{cell.east: cell})) {
          listOfWalls.add(<Cell, Cell>{cell: cell.east});
        }
      }

      if (cell.west != null) {
        if (!listOfWalls.contains(<Cell, Cell>{cell.west: cell})) {
          listOfWalls.add(<Cell, Cell>{cell: cell.west});
        }
      }
    }

    var clusters = grid.eachCell().map((c) => <Cell>{c}).toList();
    for (Map<Cell, Cell> wall in (listOfWalls..shuffle())) {
      var cellA = wall.keys.first;
      var cellB = wall.values.first;

      // If the cells divided by this wall belong to distinct sets:
      if (!clusters
          .firstWhere((cluster) => cluster.contains(cellA))
          .contains(cellB)) {
        //link cells
        cellA.link(cellB);
        // listOfWalls.remove(wall);
// substitute cluster with merged custer
        var first = clusters.firstWhere((c) => c.contains(cellA));
        clusters.remove(first);
        var second = clusters.firstWhere((c) => c.contains(cellB));
        clusters.remove(second);

        first.addAll(second);
        clusters.add(first);
      }
    }
    return grid;
  }
}
