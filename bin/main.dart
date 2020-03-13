import 'grid.dart';
import 'binary_tree.dart';
import 'sidewinder.dart';

main(List<String> args) {
  var grid = Grid(6, 5);
  var bt = BinaryTree().on(grid);

  // print(bt);
  var grid2 = Grid(4, 4);

  var sidewinder = Sidewinder().on(grid2);
  print(sidewinder);
}
