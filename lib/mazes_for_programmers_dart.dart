import 'sidewinder.dart';

import 'binary_tree.dart';
import 'grid.dart';

void run() {
  var grid = Grid(6, 5);
  var bt = BinaryTree().on(grid);

  print(bt);
  bt.toPNG('binaryTree');
  var grid2 = Grid(4, 4);

  var sidewinder = Sidewinder().on(grid2);
  print(sidewinder);
  sidewinder.toPNG('sidewinder.png');
}
