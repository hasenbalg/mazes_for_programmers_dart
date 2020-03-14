import 'package:mazes_for_programmers_dart/aldours_broder.dart';
import 'package:mazes_for_programmers_dart/colored_grid.dart';
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

  print('path from nw corner to sw corner');

  var grid4 = DistanceGrid(4, 4);
  Sidewinder().on(grid4);
  var start4 = grid4.grid[0][0];
  var distances4 = start4.distances();
  grid4.distances = distances4.pathTo(grid4.grid[grid4.rows - 1][0]);
  print(grid4);

  print('longest path from nw corner to sw corner');

  var gridPL = DistanceGrid(5, 10);
  Sidewinder().on(gridPL);

  var startLP = gridPL.grid[0][0];

  var distancesLP = startLP.distances();
  var newStart = distancesLP.max().keys.first;
  var newDistances = newStart.distances();

  var goal = newDistances.max().keys.first;
  // var distanceLongestPath = newDist.values.first;

  gridPL.distances = newDistances.pathTo(goal);
  print(gridPL);

  gridPL.distances = newDistances.pathTo(gridPL.grid[gridPL.rows - 1][0]);
  print(gridPL);

  print('colored by distance');

  var gridCBT = ColoredGrid(25, 25);
  BinaryTree().on(gridCBT);
  var startCBT = gridCBT.grid[12][12];
  gridCBT.distances = startCBT.distances();

  gridCBT.toPNG('coloredBT');
  print('saved colored binary tree maze');

  var gridCSW = ColoredGrid(25, 25);
  Sidewinder().on(gridCSW);
  var startCSW = gridCSW.grid[12][12];
  gridCSW.distances = startCSW.distances();

  gridCSW.toPNG('coloredSW');
  print('saved colored sidewinder maze');

  var gridCAB = ColoredGrid(25, 25);
  AldoursBroder().on(gridCAB);
  var startCAB = gridCAB.grid[12][12];
  gridCAB.distances = startCAB.distances();

  gridCSW.toPNG('coloredAB');
  print('saved colored Aldour-Bloder maze');
}
