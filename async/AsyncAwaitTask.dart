
import 'dart:io';

//async 简化 Future。 表示是一个异步任务，但不会并行执行。 加到Event队列中。
//await 表示是 同步执行。等待其后语句完成。
Future<int> doTask() async {
  await sleep(const Duration(seconds:2));
  print("stone");
  return 1;
}

doTaskA() async {//省略返回类型
  print("stone a");
  return 2;
}

main() {
  /*
   * doTask() sleep 前有await：会先输出 stone a；
   * doTask() sleep 没有await：会先输出 stone；
   */
  var res = doTask();
  doTaskA().then((value) => null);
}
