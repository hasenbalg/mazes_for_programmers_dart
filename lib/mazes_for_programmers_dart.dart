import 'package:mazes_for_programmers_dart/algorithms/recursive_backtracker.dart';
import 'package:mazes_for_programmers_dart/mask.dart';
import 'package:mazes_for_programmers_dart/masked_grid.dart';

void run() {
  // var mask = Mask.fromTXT('mask.txt');
  var mask = Mask.fromPNG('test.png');

  var grid = MaskedGrid(mask);

  RecursiceBacktracker().on(grid);
  //MaskedGrid must inherit form DistanceGrid to make this work
  // var start = grid.randomCell();
  // grid.distances = start.distances();
  // print(grid);
  grid.toPNG('masked.png');
}
