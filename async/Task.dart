import 'dart:async';
import 'dart:io';

void myTask() {
  print("this is task of myTask");

}

void myTaskA() {
  sleep(Duration(seconds: 3));
  print("this is task of myTaskA");
}

void myTaskB(String name) {
  print("this is task of $name");
}

void myTaskC() {
  print("this is task of myTaskC");
}

//
void main() {
  //1. 使用 scheduleMicrotask 方法添加到 Microtask 队列
  scheduleMicrotask(myTask);

  //2. Future  添加到 Microtask 队列
  Future.microtask(myTask);

  // scheduleMicrotask(myTaskA("")); //不能用于有参的函数，Future也不行

  //将任务添加到Event队列. 使用 Future()
  Future(myTaskA);
  //main()中，其它方法执行完，再执行队列中的。microTask队列先执行，再Event队列。
  Future.microtask(myTask);

  //延迟添加到 Event 队列。
  Future.delayed(Duration(seconds: 2), myTaskA);

  //创建Future实例。是添加到 Event队列的。
  Future( () => myTaskB("Stone") );

  //普通方法执行完，才执行队列中的。
  print("test");

  //比 Microtask 还要先执行
  Future.sync(myTaskC); //立即执行

  //then注册回调, 拿到结果后立即执行，不加入队列。
  var f1 = Future.value(100).then((value) => value); //then中返回了 value

  //catchError 异常捕获
  var f2 = Future.value(110)
      .then((value) => print(value/null))
      // .catchError((e) { print("error:$e"); });
      .catchError((e) => print("error:${e.runtimeType}"));//箭头函数只能跟单表达式。

  //构建error，需要catchError，否则会中断进程
  Future.error(AssertionError()).catchError((e) => print(e));
  // Future.error(StateError("error state"));

  //等待Future集合完成，生成新的Future。 then中 value参数是 每个子Future的返回值。
  Future.wait([f1, f2]).then((value) {
    print(value); //print:  [100, null]
    print(value);
  });
}
