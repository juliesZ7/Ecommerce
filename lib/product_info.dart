class ProductInfo {
  final String id;
  final String image;
  final String name;
  final String price;
  final String description;
  ProductInfo({this.id, this.image, this.name, this.price, this.description});
}

List<ProductInfo> product = [
  ProductInfo(
      id: 'ID1',
      image: 'assets/graphics/samsung-galaxy-note-9.jpg',
      name: 'Name 1',
      price: '\$10',
      description: 'Description'),
  ProductInfo(
      id: 'ID2',
      image: 'assets/graphics/iphone-12.jpg',
      name: 'Name 2',
      price: '\$20',
      description: 'Description'),
  ProductInfo(
      id: 'ID3',
      image: 'assets/graphics/iphone-xs-max-gold.jpg',
      name: 'Name 3',
      price: '\$30',
      description: 'Description'),
  ProductInfo(
      id: 'ID4',
      image: 'assets/graphics/oppo-a83.jpg',
      name: 'Name 4',
      price: '\$40',
      description: 'Description'),
];
