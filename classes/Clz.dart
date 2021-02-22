class Clz {
  String name;
  DateTime time;
  static int sex; //只能用 类名. 访问
  Clz(this.time, int a) {//this.time 会自动赋值.   默认构造函数只能有一个

  }

  Clz.name(this.name, int b) { //命名构造函数。 类名.函数名

  }

  Clz.abc(String name): this.name(name, 0); //: 重定向构造方法, {} 不能有方法体

  //初始化成员变量值
  Clz.formJson(Map<String, dynamic> json)
      : name = json["name"], time = DateTime.fromMillisecondsSinceEpoch(json["time"]) {
    print(this.name);
    print(this.time);
  }

  //重定向到断言函数。 调试模式下，如果断言条件不成立，会抛异常
  Clz.redirect(Map<String, dynamic> json)
      : assert(json.containsKey("name")),
        assert(json.containsKey("time")) {
  }
}

void main() {
  // var c = Clz(DateTime.fromMillisecondsSinceEpoch(1613740515000)); //毫秒 1/10^3
  var c = Clz(DateTime.fromMicrosecondsSinceEpoch(1613740515000000), 18); //微秒 1/10^6
  print(c.time);

  var c1 = Clz.abc("stone");
  print(c1.name);

  print("---------");

  var c2 = Clz.formJson({'name':"stone", 'time': 1613740515000});

  var c3 = Clz.redirect({'name':"stone", 'time': 1613740515000});
}