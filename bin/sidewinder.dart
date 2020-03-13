import 'dart:math';

import 'grid.dart';

class Sidewinder {
  Grid on(Grid grid) {
    for (List<Cell> row in grid.eachRow()) {
      List<Cell> run = [];
      for (Cell cell in row) {
        run.add(cell);

        bool atEasternBoundry = (cell.east == null);
        bool atNorthernBoundry = (cell.north == null);
        Random rnd = Random();

        bool shouldCloseOut =
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
