import 'package:mazes_for_programmers_dart/distances.dart';

import 'grid.dart';

class DistanceGrid extends Grid {
  Distances distances;
  DistanceGrid(int rows, int cols) : super(rows, cols);
  @override
  String contentsOf(Cell cell) {
    if (distances != null && distances.getCellDistance(cell) != null) {
      return _toBase36(distances.getCellDistance(cell));
    }
    return super.contentsOf(cell);
  }

  String _toBase36(int cellDistance) {
    var symbols = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z'
    ];
    return symbols[cellDistance];
  }
}
