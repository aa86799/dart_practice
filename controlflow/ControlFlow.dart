import 'dart:math';
import '../variables/variables.dart'; //导入文件
// Importing libraries from external packages
// import 'package:test/test.dart';

// 只导入 lib1 中的 foo。(Import only foo).
//import 'package:lib1/lib1.dart' show foo;

// 导入 lib2 中除了 foo 外的所有。
//import 'package:lib2/lib2.dart' hide foo;

//as
//import 'package:lib1/lib1.dart';
//import 'package:lib2/lib2.dart' as lib2;

void main() {
  var flybyObjects = ["a", 'b', 'c',];
  // for (var item in flybyObjects) {
  //   print(item);
  // }

  //=> 箭头函数，后跟 单个表达式
  flybyObjects.where((name) => name.length == 1).forEach(print);

  print(result);

  testVariables();

  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      testClose();
      continue nowClosed;
  // 继续执行label为 nowClosed 的 case 子句。 不关心标签下的case值

    nowClosed:
    case 'NOW_CLOSED':
    // case 条件值为 CLOSED 和 NOW_CLOSED 时均会执行该语句。
      testClose();
      break;
  }
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);

void testClose() {
  print("testClose");
}