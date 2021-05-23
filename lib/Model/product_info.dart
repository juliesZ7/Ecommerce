class ProductInfoModel {
  final String id;
  final String image;
  final String name;
  final String price;
  final String description;
  ProductInfoModel(
      {this.id, this.image, this.name, this.price, this.description});
}

List<ProductInfoModel> product = [
  ProductInfoModel(
      id: 'ID1',
      image: 'assets/graphics/samsung-galaxy-note-9.jpg',
      name:
          'Điện Thoại Samsung Galaxy Note9 Mới 100% /Hàn Quốc/ Mỹ/ Hongkong/Ram8Gb/Room512Gb',
      price: '9.000.000đ',
      description: 'Description'),
  ProductInfoModel(
      id: 'ID2',
      image: 'assets/graphics/iphone-12.jpg',
      name: 'Điện Thoại iPhone 12 Pro 128GB - Hàng Chính Hãng',
      price: '25.000.000đ',
      description: 'Description'),
  ProductInfoModel(
      id: 'ID3',
      image: 'assets/graphics/iphone-xs-max-gold.jpg',
      name: 'Điện Thoại iPhone XS Max Gold 512GB - Hàng Nhập Khẩu',
      price: '12.000.000đ',
      description:
          'Mã Quốc Tế: ZP,LL,ZA,...\nNguyên seal, mới 100%, chưa active\nThiết kế: Nguyên khối\nMàn hình OLED: 6.5 inch Super Retina (2688 x 1242), 458ppi, 3D Touch, TrueTone Dolby Vision HDR 10\nCamera Trước/Sau: 7MP/ 2 camera 12MP\nCPU: A12 Bionic 64-bit 7nm\nBộ Nhớ: 512GB\nRAM: 4GB\nGồm 2 sim: nano-Sim và eSim\nĐạt chuẩn chống nước bụi IP68, Face ID'),
  ProductInfoModel(
      id: 'ID4',
      image: 'assets/graphics/oppo-a83.jpg',
      name:
          'Điện thoại Oppo A83 2sim ram 4G bộ nhớ 64G mới Chính hãng, Camera siêu nét',
      price: '1.750.000đ',
      description: 'Description'),
  ProductInfoModel(
      id: 'ID5',
      image: 'assets/graphics/pixel2XL.jpg',
      name:
          'Điện thoại Google Pixel 2XL màn to, quay video 4k, chụp ảnh siêu nét',
      price: '3.199.000đ',
      description: 'Description'),
];
