class Parent {
  String name;
  Parent(this.name) {
    print(this.name);
  }
}

class Sub extends Parent {
    Sub(String name): super(name);
}

void main() {
  Parent obj = Sub("stone");

}