import 'dart:async';
import 'dart:isolate';

Isolate _isolate;
main() async {
  //创建接收端口
  ReceivePort rp = ReceivePort();
  //发送端口
  SendPort sp = rp.sendPort;

  // 创建并发Isolate。spawn (译.产卵,生产)。 entryPoint是初始函数。第二个参数为 T message。
  _isolate = await Isolate.spawn(entryPoint, sp);

  rp.listen((message) {
    print('A 接收到: $message');
    if (message is SendPort) {
      SendPort sub = message;
      sub.send(sp);
      sub.send("main msg");
      sub.send("close");
    }

    if (message == "close") {
      _isolate?.kill();
      rp.close();
    }
  });
}

entryPoint(SendPort sp) {
  ReceivePort rp = ReceivePort();
  rp.listen((message) {
    print('B 接收到: $message');
    if (message is SendPort) {
      SendPort main = message;
      main.send("sub msg");
    }
    if (message == "close") {
      sp.send("close");
      _isolate?.kill();
      rp.close();
    }
  });

  sp.send(rp.sendPort); //A 发送 B 的 sendPort
}

/*
 * 双向通信，流程：
 * sp.send(rp.sendPort); //A 发送 B 的 sendPort
 */