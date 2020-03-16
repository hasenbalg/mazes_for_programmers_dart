import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

class Kruskal implements Algorithm {
  @override
  Grid on(Grid grid) {
    var listOfWalls = [];
    for (var cell in grid.eachCell()) {
      if (cell.north != null) {
        listOfWalls.add(<Cell, Cell>{cell: cell.north});
      }

      if (cell.west != null) {
        listOfWalls.add(<Cell, Cell>{cell: cell.west});
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

        // substitute cluster with merged custer
        var first = clusters.firstWhere((c) => c.contains(cellA));
        var second = clusters.firstWhere((c) => c.contains(cellB));
        clusters.remove(second);

        first.addAll(second);
        // clusters.add(first);
      }
    }
    return grid;
  }
}
