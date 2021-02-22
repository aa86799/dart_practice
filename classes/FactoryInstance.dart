class FactoryInstance {
  static final FactoryInstance _instance = FactoryInstance.newInstance();

  factory FactoryInstance() => _instance;

  FactoryInstance.newInstance();
}

void main() {
  var instance1 = FactoryInstance();
  var instance2 = FactoryInstance();
  print(instance2 == instance1); //true

}