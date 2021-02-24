import 'dart:io';
import 'dart:isolate';

/*
Isolate有着自己的内存并且不存在通过共享内存的方式实现Isolate之间的通信；
每个Isolate都有自己的事件循环；
在Isolate中是通过Port进行通信的。Port分为两种一种是receive port用于接收消息。
另外一种是send port用于发送消息；
使用Isolate时，可以通过spwan()方法启动一个Isolate
 */

/*
 * 一对 ReceivePort、SendPort，发送消息，接收处理消息。
 */
onWay() async {
  print("task a");
  //创建接收端口
  ReceivePort rp = ReceivePort();
  //发送端口
  SendPort sp = rp.sendPort;

  rp.listen((message) {
    if (message == 100) {
      print("success");
    } else {
      print("error");
    }
  });
  sp.send(100);
  sp.send(101);
  print("----");
}

onWay2() async {
  print("task a");
  //创建接收端口，用来接收子线程消息
  ReceivePort rp = ReceivePort();
  //发送端口
  SendPort sp = rp.sendPort;

  // 创建并发Isolate。spawn (译.产卵,生产)。 entryPoint是初始函数。第二个参数为 T message。
  var isolate = await Isolate.spawn(entryPoint, sp);
  print(isolate.runtimeType);

  rp.listen((message) {
    if (message == 100) {
      print("success");
    } else {
      print("error");
      rp.close(); //关闭接收端口(也就关闭了发送)
    }
  });
  print("----");
}

entryPoint(SendPort sp) {
  sp.send(100);
  sleep(Duration(seconds: 2));
  sp.send(101);
}

main() {
  // onWay();
  onWay2();

}


