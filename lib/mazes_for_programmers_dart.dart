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

  Map<Algorithm, num> averages;
  averages = {};
  for (var algorythm in algorithms) {
    print('running $algorythm');

    List<int> deadEndCounts;
    deadEndCounts = [];
    for (var i = 0; i < tries; i++) {
      var grid = Grid(size, size);
      algorythm.on(grid);
      deadEndCounts.add(grid.deadEnds().length);
    }
    int totalDeadEnds;
    totalDeadEnds = deadEndCounts.fold(0, (a, b) => a + b);
    averages[algorythm] = totalDeadEnds / deadEndCounts.length;
  }

  var totalCells = size * size;

  print('');
  print(
      'Average dead ends per ${size}x${size} maze (${size * size} total cells):');
  print('');

  // var sortedKeys = averages.keys.toList(growable: false)
  //   ..sort((k1, k2) => averages[k1].compareTo(averages[k2]));
  // var sortedAlgorithms = LinkedHashMap.fromIterable(sortedKeys,
  //     key: (k) => k, value: (k) => averages[k]);

  // for (var algorithm in sortedAlgorithms.entries) {
  // for (var algorithm in averages.entries) {
  //   var value = averages[algorithm];
  //   var percentage = value * 100 / (size * size);
  //   print(
  //       '${algorithm.key}: ${averages[algorithm]}, ${totalCells}, ${percentage}');
  // }
  averages.forEach((algorithm, number) {
    var percentage = number * 100 / (size * size);
    print(
        '${algorithm.toString().split('\'')[1]}: \t${number}/\t${totalCells},\t${percentage} %');
  });
}
