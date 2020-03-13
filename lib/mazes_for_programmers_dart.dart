import 'package:mazes_for_programmers_dart/distance_grid.dart';

import 'sidewinder.dart';

import 'binary_tree.dart';
import 'grid.dart';

void run() {
  var grid = Grid(6, 5);
  var bt = BinaryTree().on(grid);

  print(bt);
  bt.toPNG('binaryTree');
  var grid2 = Grid(4, 4);

  var sidewinder = Sidewinder().on(grid2);
  print(sidewinder);
  sidewinder.toPNG('sidewinder.png');

  var grid3 = DistanceGrid(4, 4);
  BinaryTree().on(grid3);
  var start = grid3.grid[0][0];
  var distances = start.distances();
  grid3.distances = distances;
  print(grid3);

  var grid4 = DistanceGrid(4, 4);
  Sidewinder().on(grid4);
  var start4 = grid4.grid[0][0];
  var distances4 = start4.distances();
  grid4.distances = distances4;
  print(grid4);
}
