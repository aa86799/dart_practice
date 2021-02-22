void testVariables() {
  var name = 'Voyager I';
  var year = 1977; // <==> int year = 1977
  var antennaDiameter = 3.7; //<==> double antennaDiameter = 3.7
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune']; //List<String>
  var emptyList = <String>[]; //List<String>
  var setObjects = {'Jupiter', 'Saturn', 'Uranus', 'Neptune'}; //Set<String>
  var emptySet = <String>{};//Set<String>;
  var image = {//map<String, Object>
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print(emptyList.runtimeType);
  print(emptySet.runtimeType);
  print(image.runtimeType);


  var mix = """
    中华人民共和国
    admin
      stone
  """;
  // print(mix);

  var origin = r"admin\nadmin";
  print("原样输出: " + origin);

  //动态类型
  dynamic v = "aic";
  print(v.runtimeType);
  v = 18;
  print(v.runtimeType);
}
