import 'dart:collection';

import 'package:mazes_for_programmers_dart/algorithms/algorithm.dart';

import 'grid.dart';

import 'package:mazes_for_programmers_dart/algorithms/sidewinder.dart';
import 'package:mazes_for_programmers_dart/algorithms/aldours_broder.dart';
import 'package:mazes_for_programmers_dart/algorithms/hunt_and_kill.dart';
import 'package:mazes_for_programmers_dart/algorithms/wilson.dart';
import 'package:mazes_for_programmers_dart/algorithms/binary_tree.dart';

void run() {
  var algorithms = [
    BinaryTree(),
    Sidewinder(),
    AldoursBroder(),
    Wilson(),
    HuntAndKill(),
  ];
  var tries = 50;
  var size = 20;

  Map<Algorithm, List<num>> averages;
  averages = {};
  for (var algorythm in algorithms) {
    print('running $algorythm');

    List<int> deadEndCounts;
    deadEndCounts = [];
    List<int> timingCounter;
    timingCounter = [];
    for (var i = 0; i < tries; i++) {
      var startTime = DateTime.now().microsecondsSinceEpoch;
      var grid = Grid(size, size);
      algorythm.on(grid);
      var endTime = DateTime.now().microsecondsSinceEpoch;
      timingCounter.add(endTime - startTime);
      deadEndCounts.add(grid.deadEnds().length);
    }
    int totalDeadEnds;
    totalDeadEnds = deadEndCounts.fold(0, (a, b) => a + b);
    int totalTime;
    totalTime = timingCounter.fold(0, (a, b) => a + b);
    averages[algorythm] = [
      totalDeadEnds / deadEndCounts.length,
      totalTime / timingCounter.length
    ];
  }

  var totalCells = size * size;

  print('');
  print(
      'Average dead ends per ${size}x${size} maze (${size * size} total cells):');
  print('');

  averages.forEach((algorithm, numbers) {
    var percentage = numbers[0] * 100 / (size * size);
    var time = numbers[1].toString().padLeft(6, ' ');
    var deadEnds = numbers[0].toString().padLeft(6, ' ');
    print(
        '${algorithm.toString().split('\'')[1]}: \t ${deadEnds} / \t ${totalCells}, \t ${percentage} % \t ${time} microsec');
  });
}
