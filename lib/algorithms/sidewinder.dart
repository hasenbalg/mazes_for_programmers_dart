import 'dart:math';

import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

class Sidewinder implements Algorithm {
  @override
  Grid on(Grid grid) {
    for (var row in grid.eachRow()) {
      List<Cell> run;
      run = [];
      for (var cell in row) {
        run.add(cell);

        var atEasternBoundry = (cell.east == null);
        var atNorthernBoundry = (cell.north == null);
        var rnd = Random();

        var shouldCloseOut =
            atEasternBoundry || (!atNorthernBoundry && rnd.nextInt(2) == 0);

        if (shouldCloseOut) {
          var member = (run..shuffle()).first;
          if (member.north != null) {
            member.link(member.north);
          }
          run.clear();
        } else {
          cell.link(cell.east);
        }
      }
    }
    return grid;
  }
}
