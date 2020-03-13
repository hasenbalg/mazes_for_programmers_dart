import 'package:mazes_for_programmers_dart/distances.dart';

class Cell {
  final int row, col;
  Cell north, south, east, west;
  Map<Cell, bool> links;
  Cell(this.row, this.col) {
    north = null;
    south = null;
    east = null;
    west = null;
    links = <Cell, bool>{};
  }

  Cell link(Cell cell, {bool bidi = true}) {
    links[cell] = true;
    if (bidi) {
      cell.link(this, bidi: false);
    }
    return this;
  }

  Cell unkink(Cell cell, {bool bidi = true}) {
    links.remove(cell);
    if (bidi) {
      cell.unkink(this, bidi: false);
    }
    return this;
  }

  bool isLinked(Cell cell) {
    return links.containsKey(cell);
  }

  List<Cell> neighbors() {
    var neighbors = [];
    if (north != null) {
      neighbors.add(north);
    }
    if (south != null) {
      neighbors.add(south);
    }
    if (west != null) {
      neighbors.add(west);
    }
    if (east != null) {
      neighbors.add(east);
    }
    return neighbors;
  }

  Distances distances() {
    var distances = Distances(this);
    List<Cell> frontier;
    frontier = [this];
    while (frontier.isNotEmpty) {
      List<Cell> newFronier;
      newFronier = [];
      for (var cell in frontier) {
        for (var linked in cell.getLinkedCells()) {
          if (distances.getCellDistance(linked) != null) {
            continue;
          }
          distances.setCellDistance(
              linked, distances.getCellDistance(cell) + 1);
          newFronier.add(linked);
        }
      }
      frontier = newFronier;
    }
    return distances;
  }

  List<Cell> getLinkedCells() => links.keys.toList();
}
