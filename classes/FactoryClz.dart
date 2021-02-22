class FactoryClz {
  String name;

  FactoryClz(this.name) {
    print("name is $name");
  }

  /*
   * 工厂构造函数不需要每次构建新的实例，且不会自动生成实例,而是通过代码来决定返回的实例对象；
   * 工厂构造函数类似于 static 静态成员，无法访问 this 指针；
   * 一般需要依赖其他类型构造函数；
   * 工厂构造函数还可以实现单例；
   */
  factory FactoryClz.fac(String name) {
    switch (name) {
      case "adult": {
        return FactoryClz("stone");
      }
        // break;
      default:
        return FactoryClz("leo");
        // break;
    }
  }
}

void main() {
  FactoryClz.fac("adult");
  FactoryClz.fac("youth");
}
