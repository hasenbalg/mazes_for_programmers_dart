import 'package:mazes_for_programmers_dart/algorithms/recursive_backtracker.dart';
import 'package:mazes_for_programmers_dart/mask.dart';
import 'package:mazes_for_programmers_dart/masked_grid.dart';

void run() {
  var mask = Mask(5, 5);
  mask.setBitValue(0, 0, false);
  mask.setBitValue(2, 2, false);
  mask.setBitValue(4, 4, false);

  var grid = MaskedGrid(mask);

  RecursiceBacktracker().on(grid, startAt: grid.grid[1][1]);
  print(grid);
}
