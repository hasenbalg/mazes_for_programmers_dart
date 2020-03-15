import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

class RecursiceBacktracker extends Algorithm {
  @override
  Grid on(Grid grid) {
    List<Cell> stack;
    stack = [];
    stack.add(grid.randomCell());

    while (stack.isNotEmpty) {
      var current = stack.last;
      var neighbors =
          current.neighbors().where((n) => n.links.isEmpty).toList();

      if (neighbors.isEmpty) {
        stack.removeLast();
      } else {
        var neighbor = (neighbors..shuffle()).first;
        current.link(neighbor);
        stack.add(neighbor); // new current cell
      }
    }
    return grid;
  }
}
