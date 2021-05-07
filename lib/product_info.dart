class ProductInfoModel {
  final String id;
  final String image;
  final String name;
  final String price;
  final String description;
  ProductInfoModel(
      {this.id, this.image, this.name, this.price, this.description});
  void removeItems(List product, int index) {
    product.removeAt(index);
  }
}

List<ProductInfoModel> product = [
  ProductInfoModel(
      id: 'ID1',
      image: 'assets/graphics/samsung-galaxy-note-9.jpg',
      name: 'Samsung Galaxy Note 9',
      price: '\$10',
      description: 'Description'),
  ProductInfoModel(
      id: 'ID2',
      image: 'assets/graphics/iphone-12.jpg',
      name: 'Iphone 12',
      price: '\$20',
      description: 'Description'),
  ProductInfoModel(
      id: 'ID3',
      image: 'assets/graphics/iphone-xs-max-gold.jpg',
      name: 'Iphone XS Max Gold',
      price: '\$30',
      description: 'Description'),
  ProductInfoModel(
      id: 'ID4',
      image: 'assets/graphics/oppo-a83.jpg',
      name: 'Oppo A83',
      price: '\$40',
      description: 'Description'),
];
