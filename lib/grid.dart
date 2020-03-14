import 'dart:io';
import 'dart:math';

import 'package:image/image.dart';

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
    List<List<Cell>> grid;
    grid = [];
    for (var x = 0; x < rows; x++) {
      grid.add([]);
      for (var y = 0; y < cols; y++) {
        grid[x].add(Cell(x, y));
      }
    }
    return grid;
  }

  Cell randomCell() {
    var rnd = Random();

    var row = rnd.nextInt(grid.length);
    var col = rnd.nextInt(grid[row].length);
    return grid[row][col];
  }

  void configurCells() {
    for (var cell in eachCell()) {
      var row = cell.row;
      var col = cell.col;

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
  List<List<Cell>> eachRow() => grid;

  String contentsOf(Cell cell) => ' ';

  int backgroundColorFor(Cell cell) => null;

  @override
  String toString() {
    var output = '+' + ('---+' * cols) + '\n';
    for (var row in grid) {
      var top = '|';
      var bottom = '+';

      for (var cell in row) {
        cell ??= Cell(-1, -1);
        var body = ' ${contentsOf(cell)} ';
        var easternBoundry = (cell.isLinked(cell.east)) ? ' ' : '|';
        top += body + easternBoundry;

        var southernBoundry = (cell.isLinked(cell.south)) ? '   ' : '---';
        var corner = '+';

        bottom += southernBoundry + corner;
      }

      output += top + '\n';
      output += bottom + '\n';
    }

    return output;
  }

  void toPNG(String filename, {int cellSize = 100}) {
    var imgWidth = cellSize * cols;
    var imgHeight = cellSize * rows;

    var wallColor = Color.fromRgb(22, 100, 8);

    var img = Image(imgWidth + 1, imgHeight + 1);
    for (var mode in ['backgrounds', 'walls']) {
      for (var cell in eachCell()) {
        var x1 = cell.col * cellSize;
        var y1 = cell.row * cellSize;
        var x2 = (cell.col + 1) * cellSize;
        var y2 = (cell.row + 1) * cellSize;
        if (mode == 'backgrounds') {
          var color = backgroundColorFor(cell) ?? Color.fromRgb(0, 255, 0);
          // color = Color.fromRgb(0, 255, 0);
          fillRect(img, x1, y1, x2, y2, color);
        } else {
          if (cell.north == null) {
            drawLine(img, x1, y1, x2, y1, wallColor,
                antialias: false, thickness: 5);
          }
          if (cell.west == null) {
            drawLine(img, x1, y1, x1, y2, wallColor,
                antialias: false, thickness: 5);
          }

          if (!cell.isLinked(cell.east)) {
            drawLine(img, x2, y1, x2, y2, wallColor,
                antialias: false, thickness: 5);
          }
          if (!cell.isLinked(cell.south)) {
            drawLine(img, x1, y2, x2, y2, wallColor,
                antialias: false, thickness: 5);
          }
        }
      }
    }
    if (!filename.toLowerCase().endsWith('.png')) {
      filename += '.png';
    }
    File(filename).writeAsBytesSync(encodePng(img));
  }
}
