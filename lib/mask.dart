import 'dart:io';
import 'dart:math';

class Mask {
  List<List<bool>> _bits;

  int cols;

  int rows;

  Mask(this.rows, this.cols) {
    _prepareBits();
  }

  void _prepareBits() {
    _bits = [];
    for (var x = 0; x < rows; x++) {
      _bits.add([]);
      for (var y = 0; y < cols; y++) {
        _bits[x].add(true);
      }
    }
  }

  Mask.fromTXT(String filePath) {
    var lines = File(filePath).readAsLinesSync();
    rows = lines.length;
    cols = lines.first.length;
    _prepareBits();
    for (var x = 0; x < lines.length; x++) {
      for (var y = 0; y < lines[x].length; y++) {
        if (lines[x][y] == 'X') {
          setBitValue(x, y, false);
        } else {
          setBitValue(x, y, true);
        }
      }
    }
  }

  bool getBitValue(int x, int y) {
    try {
      return _bits[x][y];
    } catch (e) {
      print('Waring: Out of bounds');
      return false;
    }
  }

  void setBitValue(int x, int y, bool isOn) {
    _bits[x][y] = isOn;
  }

  int count() => _bits.expand((row) => row).where((b) => b == true).length;

  Map<int, int> getRandomLocation() {
    var rnd = Random();
    while (true) {
      var x = rnd.nextInt(rows);
      var y = rnd.nextInt(cols);
      if (_bits[x][y]) {
        return {x: y};
      }
    }
  }
}
