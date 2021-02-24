import 'dart:io';

//回调方式, then()
thenWay() {
  var writeToFile = (File file) {
    file.writeAsStringSync("thenWay: ${DateTime.now()}\n", mode: FileMode.write);
    file
        .readAsString()
        .then((value) => print(value), onError: (e) => print("error: $e"));
  };

  var file = File("async/test.txt");
  //file.exists() 返回 Future<bool>
  file.exists().then((value) {
    if (!value) {
      file.createSync();
    }
    writeToFile(file);
  });
}

//使用async/await去掉回调 优化代码可读性
newWay() async {
  var file = File("async/A/test-new.txt");
  //await 等待 Future结果 bool;
  if (!await file.exists()) {
    file.create(recursive: true); //递归创建
  }
  await file.writeAsString("newWay: ${DateTime.now()}\n", mode: FileMode.write);
  print(await file.readAsString());
}

main() async {
  thenWay();

  newWay();
}
