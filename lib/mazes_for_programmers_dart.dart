import 'package:mazes_for_programmers_dart/aldours_broder.dart';
import 'package:mazes_for_programmers_dart/colored_grid.dart';
import 'package:mazes_for_programmers_dart/distance_grid.dart';
import 'package:mazes_for_programmers_dart/hunt_and_kill.dart';
import 'package:mazes_for_programmers_dart/wilson.dart';

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

  timeAfunction(binaryTree);
  timeAfunction(sideWinder);
  timeAfunction(aldoursBroder);
  timeAfunction(wilson);
  timeAfunction(huntAndKill);
}

void binaryTree() {
  var grid = ColoredGrid(25, 25);
  BinaryTree().on(grid);
  var start = grid.grid[12][12];
  grid.distances = start.distances();

  grid.toPNG('coloredBT');
  print('saved colored binary tree maze with ${grid.deadEnds().length}');
}

void sideWinder() {
  var grid = ColoredGrid(25, 25);
  Sidewinder().on(grid);
  var start = grid.grid[12][12];
  grid.distances = start.distances();

  grid.toPNG('coloredSW');

  print('saved colored Sidewinder maze with ${grid.deadEnds().length}');
}

void aldoursBroder() {
  var grid = ColoredGrid(25, 25);
  AldoursBroder().on(grid);
  var start = grid.grid[12][12];
  grid.distances = start.distances();

  grid.toPNG('coloredAB');
  print('saved colored Aldour-Bloder maze with ${grid.deadEnds().length}');
}

void wilson() {
  var grid = ColoredGrid(25, 25);
  Wilson().on(grid);
  var start = grid.grid[12][12];
  grid.distances = start.distances();

  grid.toPNG('coloredW');
  print('saved colored Wilson maze with ${grid.deadEnds().length}');
}

void huntAndKill() {
  var grid = ColoredGrid(25, 25);
  HuntAndKill().on(grid);
  var start = grid.grid[12][12];
  grid.distances = start.distances();
  grid.toPNG('coloredCHAK');
  print('saved colored Hunt and Kill maze with ${grid.deadEnds().length}');
}

void timeAfunction(Function f) {
  var startTime = DateTime.now().microsecondsSinceEpoch;
  f();
  print(
      '${f.toString().split('\'')[1]} took ${DateTime.now().microsecondsSinceEpoch - startTime} ms');
}
