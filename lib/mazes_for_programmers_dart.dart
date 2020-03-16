import 'package:mazes_for_programmers_dart/algorithms/recursive_backtracker.dart';
import 'package:mazes_for_programmers_dart/mask.dart';
import 'package:mazes_for_programmers_dart/masked_grid.dart';

void run() {
  var mask = Mask.fromTXT('mask.txt');

  var grid = MaskedGrid(mask);

  RecursiceBacktracker().on(grid, startAt: grid.grid[1][1]);
  print(grid);
  grid.toPNG('masked.png');
}
