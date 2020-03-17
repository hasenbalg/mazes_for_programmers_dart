import 'dart:io';
import 'dart:math';

import 'package:image/image.dart';

class Mask {
  List<List<bool>> _bits;

  int cols;

  int rows;

  Mask(this.rows, this.cols) {
    _prepareBits();
  }

  void _prepareBits() {
    _bits = [];
    for (var y = 0; y < rows; y++) {
      _bits.add([]);
      for (var x = 0; x < cols; x++) {
        _bits[y].add(true);
      }
    }
  }

  Mask.fromTXT(String filePath) {
    var lines = File(filePath).readAsLinesSync();
    rows = lines.length;
    cols = lines.first.length;
    _prepareBits();
    for (var y = 0; y < lines.length; y++) {
      for (var x = 0; x < lines[y].length; x++) {
        if (lines[y][x] == 'X') {
          setBitValue(x, y, false);
        } else {
          setBitValue(x, y, true);
        }
      }
    }
  }

  Mask.fromPNG(String filePath) {
    var img = decodeImage(File(filePath).readAsBytesSync());
    rows = img.width;
    cols = img.height;
    _prepareBits();
    for (var y = 0; y < rows; y++) {
      for (var x = 0; x < cols; x++) {
        if (img.getPixel(y, x) == Color.fromRgb(0, 0, 0)) {
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
