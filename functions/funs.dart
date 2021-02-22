void main() {
  print(add2(18, 19));

  //定义一个无参匿名方法并立即运行
  () {
    print("hello world");
  }();

  //定义一个有参匿名方法并立即运行
  (int i,int j) {
    print('i+j=${i+j}');
  }(7,8);

  var fun = () {
    print("hello world");
  };
  print("fun is function:${fun is Function}");//true
  fun();
}

int add(int a, int b) {
  return a + b;
}

//如果方法里只有一行，可以简写（可以省略{}和return），并使用 =>
int add2(int a, int b) => a + b;

int add3(a, b) => a + b; //动态参数类型
