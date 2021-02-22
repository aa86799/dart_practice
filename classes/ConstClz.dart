class ConstClz {
  final String name;
  ConstClz(this.name, {int age = 8}) {
    print("name is $name");
  }

  //常量构造函数，不能有方法体; const 修饰；
  const ConstClz.newConst(this.name);
}

void main() {
  ConstClz("stone", );

  const ConstClz  c = ConstClz.newConst("stone"); //实例化，声明时加上 const
  // c = ConstClz("name"); //常量对象不可变
}