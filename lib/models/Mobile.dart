class Mobile {
  String imagePath;
  String name;
  String storage;
  String ram;
  String size;
  String price;
  String colors;
  String camera;
  String cpu;
  String rating;

  Mobile({
    required this.imagePath,
    required this.name,
    required this.storage,
    required this.ram,
    required this.size,
    required this.price,
    required this.colors,
    required this.camera,
    required this.cpu,
    required this.rating,
  });

  String get _imagePath => imagePath;
  String get _name => name;
  String get _storage => storage;
  String get _ram => ram;
  String get _size => size;
  String get _price => price;
  String get _colors => colors;
  String get _camera => camera;
  String get _cpu => cpu;
  String get _rating => rating;
}
