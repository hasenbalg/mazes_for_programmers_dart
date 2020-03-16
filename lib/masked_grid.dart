import 'package:mazes_for_programmers_dart/grid.dart';
import 'package:mazes_for_programmers_dart/mask.dart';

class MaskedGrid extends Grid {
  Mask mask;

  MaskedGrid(this.mask) : super(mask.rows, mask.cols);

  @override
  List<List<Cell>> prepateGrid() {
    List<List<Cell>> grid;
    grid = [];
    for (var x = 0; x < rows; x++) {
      grid.add([]);
      for (var y = 0; y < cols; y++) {
        if (mask.getBitValue(x, y)) {
          grid[x].add(Cell(x, y));
        } else {
          grid[x].add(null);
        }
      }
    }
    return grid;
  }

  @override
  Cell randomCell() =>
      (grid.expand((c) => c).where((c) => c != null).toList()..shuffle()).first;

  @override
  int size() => mask.count();
}
