import 'dart:math';

import 'grid.dart';

class Sidewinder {
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
          var member = run[rnd.nextInt(run.length)];
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
