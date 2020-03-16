import 'package:mazes_for_programmers_dart/algorithms/recursive_backtracker.dart';
import 'package:mazes_for_programmers_dart/grid.dart';

void run() {
  var grid = Grid(5, 5);
  // orphan the cell in the western corner
  grid.grid[0][0].east.west = null;
  grid.grid[0][0].south.north = null;

  // ... and the cell in the south west corner
  grid.grid[4][4].west.east = null;
  grid.grid[4][4].north.south = null;

  RecursiceBacktracker().on(grid, startAt: grid.grid[1][1]);
  print(grid);
}
