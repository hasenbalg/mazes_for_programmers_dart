class Cell {
  final int row, col;
  Cell north, south, east, west;
  Map<Cell, bool> links;
  Cell(this.row, this.col) {
    this.north = null;
    this.south = null;
    this.east = null;
    this.west = null;
    this.links = Map<Cell, bool>();
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
    List<Cell> neighbors = [];
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
}
