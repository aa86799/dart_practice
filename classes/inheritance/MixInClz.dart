class Parent {
  test() {
    print("Parent");
  }
}

class Sub extends Parent {
  test() {
    print("Sub");
  }
}

class A {
  // A() {}

  int test() {
    print("A");
  }
}

class B {
  int test() {
    print("B");
    return 1;
  }
}

class C {
  void testC() {}
}

/*
mix in 混合， 对应 with关键字。
extends with implements 可以同时使用，注意顺序。
可以with 混合多个类。
被with 混合的类不有 构造函数。
同名函数(同参数列表， 同返回值)， 在with中的顺序在后的，会赋覆盖之前的。
*/

class D extends Sub with B,A implements C {
  @override
  void testC() {
    // TODO: implement testC
  }
}

void main() {
  D obj = D();
  var res = obj.test();
  print(res);
}
