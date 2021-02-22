/*
默认的必须参数，不能赋默认值。
{} 可选命名参数，赋值必须加上参数名，不在乎命名参数的位置。可赋默认值
[] 可选位置参数，赋值不用加上参数名，注重位置。可赋默认值。
 */
void main() {
  //可选命名参数赋值， 参数名: 值
  _buildThree(20, name: "stone");
  _buildThree(20, range: 18);
  _buildThree(20, range: 19, name: "stone");

  print("");

  //可选位置参数，
  _buildHouse(30);
  _buildHouse(30, "天津");
  _buildHouse(30, "天津", 35);
}

//使用"{}"包围的参数属于可选命名参数. 可以为可选参数添加默认值
void _buildThree(int num, {String name, int range = 10}) {
  print("$num, $name, $range");
}

//在方法参数中，使用"[]"包围的参数属于可选位置参数，
void _buildHouse(int num, [String where="北京", int range]) {
  print("$num, $where, $range");
}