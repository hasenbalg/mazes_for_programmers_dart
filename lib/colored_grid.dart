import 'package:image/image.dart';
import 'package:mazes_for_programmers_dart/distance_grid.dart';
import 'package:mazes_for_programmers_dart/distances.dart';

import 'grid.dart';

class ColoredGrid extends DistanceGrid {
  int maximum;

  ColoredGrid(int rows, int cols) : super(rows, cols);

  void setDistances(Distances dist) {
    distances = dist;
  }

  @override
  int backgroundColorFor(Cell cell) {
    maximum = distances.max().values.first;
    if (distances != null && distances.getCellDistance(cell) != null) {
      var distance = distances.getCellDistance(cell);
      var intensity = (maximum - distance) / maximum;
      var dark = (255 * intensity).round();
      var bright = 128 + (127 * intensity).round();
      //color root different
      if (distances.getCellDistance(cell) == 0) {
        return Color.fromRgb(255, 0, 0);
      }
      return Color.fromRgb(dark, bright, dark);
    }

    return Color.fromRgb(255, 0, 0);
  }
}
