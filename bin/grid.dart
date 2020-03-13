import 'dart:math';

import 'cell.dart';
export 'cell.dart';

class Grid {
  int rows, cols;
  List<List<Cell>> grid;

  Grid(this.rows, this.cols) {
    grid = prepateGrid();
    configurCells();
  }
  List<List<Cell>> prepateGrid() {
    List<List<Cell>> grid = [];
    for (int x = 0; x < rows; x++) {
      grid.add([]);
      for (int y = 0; y < cols; y++) {
        grid[x].add(Cell(x, y));
      }
    }
    return grid;
  }

  Cell randomCell() {
    Random rnd = Random();

    int row = rnd.nextInt(grid.length);
    int col = rnd.nextInt(grid[row].length);
    return grid[row][col];
  }

  void configurCells() {
    for (Cell cell in eachCell()) {
      int row = cell.row;
      int col = cell.col;

      cell.north = (row - 1 >= 0) ? grid[row - 1][col] : null;
      cell.south = (row + 1 < grid.length) ? grid[row + 1][col] : null;
      cell.west = (col - 1 >= 0) ? grid[row][col - 1] : null;
      cell.east = (col + 1 < grid[row].length) ? grid[row][col + 1] : null;
    }
  }

  int size() {
    return rows * cols;
  }

  List<Cell> eachCell() => grid.expand((c) => c).toList();

  @override
  String toString() {
    String output = '+' + ('---+' * cols) + '\n';
    for (List<Cell> row in grid) {
      String top = '|';
      String bottom = '+';

      for (Cell cell in row) {
        if (cell == null) {
          cell = Cell(-1, -1);
        }
        String body = '   ';
        String easternBoundry = (cell.isLinked(cell.east)) ? ' ' : '|';
        top += body + easternBoundry;

        String southernBoundry = (cell.isLinked(cell.south)) ? '   ' : '---';
        String corner = '+';

        bottom += southernBoundry + corner;
      }

      output += top + '\n';
      output += bottom + '\n';
    }

    return output;
  }
}
