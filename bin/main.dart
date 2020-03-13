import 'grid.dart';
import 'binary_tree.dart';

main(List<String> args) {
  var grid = Grid(6, 5);
  var bt = BinaryTree().on(grid);

  print(bt);
}
