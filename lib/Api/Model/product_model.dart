class ProductModel {
  final String _id;
  final String _image;
  final String _name;
  final int _price;
  final String _description;

  ProductModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'] ?? '',
        _image = json['image'] ?? '',
        _name = json['name'] ?? '',
        _price = json['price'] ?? 0,
        _description = json['description'] ?? '';

  Map<String, dynamic> toJson() => {
        'id': _id,
        'image': _image,
        'name': _name,
        'price': _price,
        'description': _description,
      };

  String get id => _id;
  String get image => _image;
  String get name => _name;
  int get price => _price;
  String get description => _description;
}

