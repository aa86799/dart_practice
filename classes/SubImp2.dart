import 'inheritance/AbstractClz.dart';

class SubImp implements AbstractClz { //dart里没有interface关键字；使用 implements 必须重写所有方法. 对于父类中私有方法，若可见则要重写，不可见不需要
  @override
  void test() {
    // TODO: implement test
  }

  @override
  void testA() {
    // TODO: implement testA
  }

}